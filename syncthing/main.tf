resource "docker_image" "syncthing" {
  name = "syncthing/syncthing:${var.syncthing_version}"
}

resource "docker_volume" "syncthing_data" {
  name   = "${var.gluster_volume}/${var.service_name}_data"
  driver = "glusterfs:latest"
}

resource "docker_service" "syncthing" {
  name = var.service_name

  labels {
    label = "traefik.http.services.${var.service_name}.loadbalancer.server.port"
    value = var.traefik_http_port
  }

  labels {
    label = "traefik.http.routers.${var.service_name}.rule"
    value = "Host(`${var.service_name}.${var.app_domain}`)"
  }

  labels {
    label = "traefik.tcp.services.${var.service_name}.loadBalancer.server.port"
    value = "22000"
  }

  labels {
    label = "traefik.tcp.routers.${var.service_name}.entrypoints"
    value = "syncthing-discovery"
  }

  labels {
    label = "traefik.tcp.routers.${var.service_name}.rule"
    value = "HostSNI(`*`)"
  }

  labels {
    label = "traefik.tcp.routers.${var.service_name}.service"
    value = var.service_name
  }

  task_spec {
    container_spec {
      image = docker_image.syncthing.latest

      hostname = var.service_name

      env = {
        PUID = var.uid
        PGID = var.gid
      }

      mounts {
        target = "/var/syncthing"
        source = docker_volume.syncthing_data.name
        type   = "volume"
      }
    }

    networks = [var.traefik_network]
  }
}
