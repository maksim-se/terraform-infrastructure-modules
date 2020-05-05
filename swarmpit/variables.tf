variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}

variable "swarmpit_version" {
  type    = string
  default = "1.9"
}

variable "couchdb_version" {
  type    = string
  default = "2.3.0"
}

variable "influxdb_version" {
  type    = string
  default = "1.7"
}

variable "agent_version" {
  type    = string
  default = "2.2"
}

variable "service_name" {
  type    = string
  default = "swarmpit"
}

variable "traefik_network" {
  type = string
}

variable "gluster_volume" {
  type        = string
  description = "GlusterFS volume mount"
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "8080"
}
