resource "docker_image" "portainer" {
  name = "portainer/portainer:${var.portainer_version}"
}

resource "docker_image" "portainer_agent" {
  name = "portainer/agent:${var.agent_version}"
}

resource "docker_network" "portainer_agent" {
  name   = var.service_name
  driver = "overlay"
}

resource "docker_volume" "portainer_data" {
  name   = "${var.service_name}_data"
  driver = "local"
  driver_opts = {
    device = ":${var.data_volume_nfs_path}"
    o      = "addr=${var.data_volume_nfs_addr},rw,sync"
    type   = "nfs4"
  }
}

resource "docker_service" "portainer_agent" {
  name = "${var.service_name}_agent"

  mode {
    global = true
  }

  task_spec {
    container_spec {
      image = docker_image.portainer_agent.latest

      env = {
        AGENT_CLUSTER_ADDR = "tasks.${var.service_name}_agent"
      }

      mounts {
        type   = "bind"
        target = "/var/run/docker.sock"
        source = "/var/run/docker.sock"
      }

      mounts {
        type   = "bind"
        target = "/var/lib/docker/volumes"
        source = "/var/lib/docker/volumes"
      }
    }

    networks = [docker_network.portainer_agent.id]


    placement {
      constraints = [
        "node.role == manager",
        "node.platform.os == linux"
      ]
    }
  }

  labels {
    label = "traefik.enable"
    value = "false"
  }
}

resource "docker_service" "portainer" {
  name = var.service_name

  task_spec {
    container_spec {
      image = docker_image.portainer.latest

      args = ["-H", "tcp://tasks.${var.service_name}_agent:9001", "--tlsskipverify"]

      mounts {
        target = "/data"
        source = docker_volume.portainer_data.name
        type   = "volume"
      }
    }

    networks = [docker_network.portainer_agent.id, var.traefik_network]

    placement {
      constraints = [
        "node.role == manager",
      ]
    }
  }

  labels {
    label = "traefik.http.services.${var.service_name}.loadbalancer.server.port"
    value = var.traefik_http_port
  }

  labels {
    label = "traefik.http.routers.${var.service_name}.rule"
    value = "Host(`${var.service_name}.${var.app_domain}`)"
  }
}
