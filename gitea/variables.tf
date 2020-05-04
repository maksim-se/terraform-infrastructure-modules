variable "gitea_version" {
  type = string
}

variable "service_name" {
  type        = string
  default     = "gitea"
  description = "The prefix to use for docker_service resources in this module"
}

variable "user_uid" {
  type        = string
  default     = "1000"
  description = "The UID (Unix user ID) of the user that runs Gitea within the container."
}

variable "user_gid" {
  type        = string
  default     = "1000"
  description = "The GID (Unix group ID) of the user that runs Gitea within the container."
}

variable "run_mode" {
  type        = string
  default     = "prod"
  description = "For performance and other purposes, change this to prod when deployed to a production environment."
}

variable "traefik_network" {
  type        = string
  description = "The traefik network ID to use for load balancing."
}

variable "gluster_volume" {
  type        = string
  description = "GlusterFS volume mount"
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "3000"
}

variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}
