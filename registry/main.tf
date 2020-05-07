resource "docker_image" "registry" {
  name = "registry:${var.registry_version}"
}

resource "docker_service" "registry" {
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
      image = docker_image.registry.latest

      env = {
        REGISTRY_STORAGE                   = "s3"
        REGISTRY_STORAGE_S3_ACCESSKEY      = var.s3_accesskey
        REGISTRY_STORAGE_S3_SECRETKEY      = var.s3_secretkey
        REGISTRY_STORAGE_S3_REGION         = var.s3_region
        REGISTRY_STORAGE_S3_REGIONENDPOINT = var.s3_regionendpoint
        REGISTRY_STORAGE_S3_BUCKET         = var.s3_bucket
        REGISTRY_STORAGE_S3_SECURE         = false
      }
    }

    networks = [var.traefik_network]
  }
}
