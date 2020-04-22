resource "docker_image" "minio" {
  name = "minio/minio:${var.minio_version}"
}

resource "docker_secret" "access_key" {
  name = "${var.service_name}-access-key-${replace(timestamp(), ":", ".")}"
  data = base64encode(var.access_key)

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}

resource "docker_secret" "secret_key" {
  name = "${var.service_name}-secret-key-${replace(timestamp(), ":", ".")}"
  data = base64encode(var.secret_key)

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}

resource "docker_volume" "minio_data" {
  name   = "${var.service_name}_data"
  driver = "local"
  driver_opts = {
    device = ":${var.data_volume_nfs_path}"
    o      = "addr=${var.data_volume_nfs_addr},rw,sync"
    type   = "nfs4"
  }
}

resource "docker_service" "minio" {
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
      image = docker_image.minio.latest

      args = ["gateway", "nas", "/data"]

      secrets {
        secret_id   = docker_secret.access_key.id
        secret_name = docker_secret.access_key.name
        file_name   = "/run/secrets/access_key"
        file_mode   = 0700
      }

      secrets {
        secret_id   = docker_secret.secret_key.id
        secret_name = docker_secret.secret_key.name
        file_name   = "/run/secrets/secret_key"
        file_mode   = 0700
      }

      mounts {
        target = "/data"
        source = docker_volume.minio_data.name
        type   = "volume"
      }
    }

    networks = [var.traefik_network]
  }
}
