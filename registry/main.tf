resource "docker_image" "registry" {
  name = "registry:${var.registry_version}"
}

resource "docker_image" "registry_ui" {
  name = "jc21/registry-ui:${var.registry_ui_version}"
}

resource "docker_service" "registry" {
  name = var.service_name

  labels {
    label = "traefik.http.services.${var.service_name}.loadbalancer.server.port"
    value = var.traefik_http_port
  }

  labels {
    label = "traefik.http.routers.${var.service_name}.rule"
    value = "Host(`${var.service_name}.${var.app_domain}`) && PathPrefix(`/v2`)"
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
        REGISTRY_STORAGE_DELETE_ENABLED    = var.storage_delete_enabled
      }
    }

    networks = [var.traefik_network]
  }
}

resource "docker_service" "registry_ui" {
  name = "${var.service_name}_ui"

  labels {
    label = "traefik.http.services.${var.service_name}_ui.loadbalancer.server.port"
    value = var.traefik_http_ui_port
  }

  labels {
    label = "traefik.http.routers.${var.service_name}_ui.rule"
    value = "Host(`${var.service_name}.${var.app_domain}`) && PathPrefix(`/`)"
  }

  task_spec {
    container_spec {
      image = docker_image.registry_ui.latest

      env = {
        REGISTRY_HOST                   = var.ui_registry_host
        REGISTRY_SSL                    = var.ui_registry_ssl
        REGISTRY_DOMAIN                 = var.ui_registry_domain
        REGISTRY_STORAGE_DELETE_ENABLED = var.storage_delete_enabled
      }
    }

    networks = [var.traefik_network]
  }
}
