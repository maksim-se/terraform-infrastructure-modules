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

      args = var.args

      env = {
        TRAEFIK_API_INSECURE                      = var.api_insecure
        TRAEFIK_ENTRYPOINTS_WEB_ADDRESS           = var.entrypoints_web_address
        TRAEFIK_PROVIDERS_DOCKER                  = "true"
        TRAEFIK_PROVIDERS_DOCKER_NETWORK          = docker_network.traefik.name
        TRAEFIK_PROVIDERS_DOCKER_EXPOSEDBYDEFAULT = var.providers_docker_exposed_by_default
        TRAEFIK_PROVIDERS_DOCKER_SWARMMODE        = var.providers_docker_swarm_mode
      }

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
