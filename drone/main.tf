resource "docker_image" "drone" {
  name = "drone/drone:${var.drone_version}"
}

resource "docker_image" "drone_runner" {
  name = "drone/drone-runner-docker:${var.drone_runner_version}"
}

resource "docker_network" "drone" {
  name   = var.service_name
  driver = "overlay"
}

resource "docker_volume" "drone_data" {
  name   = "${var.service_name}_data"
  driver = "local"
  driver_opts = {
    device = ":${var.data_volume_nfs_path}"
    o      = "addr=${var.data_volume_nfs_addr},rw,sync"
    type   = "nfs4"
  }
}

resource "docker_service" "drone" {
  name = var.service_name

  labels {
    label = "traefik.http.services.${var.service_name}.loadbalancer.server.port"
    value = var.traefik_http_port
  }

  labels {
    label = "traefik.http.routers.${var.service_name}.rule"
    value = "Host(`${var.service_name}.${var.app_domain}`)"
  }

  task_spec {
    container_spec {
      image = docker_image.drone.latest

      env = {
        DRONE_USER_CREATE         = "username:${var.initial_user},admin:true"
        DRONE_GITEA_SERVER        = var.gitea_server
        DRONE_GITEA_CLIENT_ID     = var.gitea_client_id
        DRONE_GITEA_CLIENT_SECRET = var.gitea_client_secret
        DRONE_RPC_SECRET          = var.rpc_secret
        DRONE_SERVER_HOST         = var.server_host
        DRONE_SERVER_PROTO        = var.server_proto
      }

      mounts {
        target = "/data"
        source = "docker_volume.${var.service_name}_data"
        type   = "volume"
      }
    }

    networks = [var.traefik_network, docker_network.drone.id, var.gitea_network]
  }
}

resource "docker_service" "drone_runner" {
  name = "${var.service_name}-runner"

  labels {
    label = "traefik.enalbe"
    value = "false"
  }

  task_spec {
    container_spec {
      image = docker_image.drone_runner.latest

      env = {
        DRONE_RPC_HOST   = docker_service.drone.name
        DRONE_RPC_PROTO  = "http"
        DRONE_RPC_SECRET = var.rpc_secret
      }

      mounts {
        target = "/var/run/docker.sock"
        source = "/var/run/docker.sock"
        type   = "bind"
      }
    }

    networks = [var.traefik_network, docker_network.drone.id, var.gitea_network]
  }
}
