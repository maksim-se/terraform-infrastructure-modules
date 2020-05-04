resource "docker_image" "gitea" {
  name = "gitea/gitea:${var.gitea_version}"
}

resource "docker_network" "gitea" {
  name   = var.service_name
  driver = "overlay"
}

resource "docker_volume" "gitea_data" {
  name   = "${var.gluster_volume}/${var.service_name}_data"
  driver = "glusterfs:latest"
}

resource "docker_service" "gitea" {
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
      image = docker_image.gitea.latest

      env = {
        USER_UID = var.user_uid
        USER_GID = var.user_gid
        RUN_MODE = var.run_mode
      }

      mounts {
        target = "/data"
        source = docker_volume.gitea_data.name
        type   = "volume"
      }
    }

    networks = [var.traefik_network]
  }
}
