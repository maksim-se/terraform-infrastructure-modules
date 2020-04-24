resource "docker_image" "traefik" {
  name = "traefik:${var.traefik_version}"
}

resource "docker_image" "docker_socket_proxy" {
  name = "tecnativa/docker-socket-proxy:${var.docker_socket_proxy_version}"
}

resource "docker_network" "traefik" {
  name   = var.service_name
  driver = "overlay"
}

resource "docker_service" "traefik" {
  name = var.service_name

  task_spec {
    container_spec {
      image = docker_image.traefik.latest

      args = concat(
        [
          "--api-insecure=${var.api_insecure}",
          "--entryPoints.web.address=${var.entrypoints_web_address}",
          "--providers.docker=true",
          "--providers.docker.network=${docker_network.traefik.name}",
          "--providers.docker.exposedByDefault=${var.providers_docker_exposed_by_default}",
          "--providers.docker.swarmMode=${var.providers_docker_swarm_mode}"
        ],
      var.args)

      mounts {
        read_only = true
        target    = "/var/run/docker.sock"
        source    = "/var/run/docker.sock"
        type      = "bind"
      }
    }

    networks = [docker_network.traefik.id]

    placement {
      constraints = [
        "node.role==manager",
      ]
    }

    restart_policy = {
      condition    = "on-failure"
      delay        = "3s"
      max_attempts = 4
      window       = "10s"
    }
  }

  labels {
    label = "traefik.enable"
    value = "false"
  }

  endpoint_spec {
    ports {
      target_port    = 80
      published_port = 80
    }
    ports {
      target_port    = 8080
      published_port = 8080
    }
  }
}
