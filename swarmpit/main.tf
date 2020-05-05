resource "docker_image" "swarmpit" {
  name = "swarmpit/swarmpit:${var.swarmpit_version}"
}

resource "docker_image" "swarmpit_agent" {
  name = "swarmpit/agent:${var.agent_version}"
}

resource "docker_image" "influxdb" {
  name = "influxdb:${var.influxdb_version}"
}

resource "docker_image" "couchdb" {
  name = "couchdb:${var.couchdb_version}"
}

resource "docker_network" "swarmpit" {
  name   = var.service_name
  driver = "overlay"
}

resource "docker_volume" "swarmpit_db" {
  name   = "${var.gluster_volume}/${var.service_name}/db"
  driver = "glusterfs:latest"
}

resource "docker_volume" "swarmpit_influxdb" {
  name   = "${var.gluster_volume}/${var.service_name}/influxdb"
  driver = "glusterfs:latest"
}

resource "docker_service" "swarmpit" {
  name = var.service_name

  task_spec {
    container_spec {
      image = docker_image.swarmpit.latest

      env = {
        SWARMPIT_DB       = "http://${var.service_name}_db:5984"
        SWARMPIT_INFLUXDB = "http://${var.service_name}_influxdb:8086"
      }

      mounts {
        target = "/var/run/docker.sock"
        source = "/var/run/docker.sock"
        type   = "bind"
      }
    }

    networks = [docker_network.swarmpit.id, var.traefik_network]

    resources {
      limits {
        nano_cpus    = 500000000
        memory_bytes = 1073741824
      }
      reservation {
        nano_cpus    = 250000000
        memory_bytes = 536870912
      }
    }

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

resource "docker_service" "swarmpit_agent" {
  name = "${var.service_name}_agent"

  mode {
    global = true
  }

  task_spec {
    container_spec {
      image = docker_image.swarmpit_agent.latest

      env = {
        DOCKER_API_VERSION    = "1.40"
        EVENT_ENDPOINT        = "http://${var.service_name}:8080/events"
        HEALTH_CHECK_ENDPOINT = "http://${var.service_name}:8080/version"
      }

      mounts {
        target = "/var/run/docker.sock"
        source = "/var/run/docker.sock"
        type   = "bind"
      }
    }

    networks = [docker_network.swarmpit.id]

    resources {
      limits {
        nano_cpus    = 10000000
        memory_bytes = 67108864
      }
      reservation {
        nano_cpus    = 50000000
        memory_bytes = 33554432
      }
    }
  }

  labels {
    label = "swarmpit.agent"
    value = "true"
  }
}

resource "docker_service" "swarmpit_db" {
  name = "${var.service_name}_db"

  task_spec {
    container_spec {
      image = docker_image.couchdb.latest

      mounts {
        target = "/opt/couchdb/data"
        source = docker_volume.swarmpit_db.name
        type   = "volume"
      }
    }

    networks = [docker_network.swarmpit.id]

    resources {
      limits {
        nano_cpus    = 300000000
        memory_bytes = 268435456
      }
      reservation {
        nano_cpus    = 150000000
        memory_bytes = 134217728
      }
    }

  }

  labels {
    label = "traefik.enable"
    value = "false"
  }
}

resource "docker_service" "swarmpit_influxdb" {
  name = "${var.service_name}_influxdb"

  task_spec {
    container_spec {
      image = docker_image.influxdb.latest

      mounts {
        target = "/var/lib/influxdb"
        source = docker_volume.swarmpit_influxdb.name
        type   = "volume"
      }
    }

    networks = [docker_network.swarmpit.id]

    resources {
      limits {
        nano_cpus    = 600000000
        memory_bytes = 536870912
      }
      reservation {
        nano_cpus    = 300000000
        memory_bytes = 134217728
      }
    }
  }

  labels {
    label = "traefik.enable"
    value = "false"
  }
}
