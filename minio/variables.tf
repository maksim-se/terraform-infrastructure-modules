variable "minio_version" {
  type = string
}

variable "service_name" {
  type        = string
  default     = "minio"
  description = "The prefix to use for docker_service resources in this module"
}

variable "traefik_network" {
  type        = string
  description = "The traefik network ID to use for load balancing."
}

variable "access_key" {
  type        = string
  description = "Minio Admin Access Key"
}

variable "secret_key" {
  type        = string
  description = "Minio Admin Secret Key"
}

variable "gluster_volume" {
  type        = string
  description = "GlusterFS volume mount"
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "9000"
}

variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}
