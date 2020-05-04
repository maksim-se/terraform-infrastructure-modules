variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}

variable "portainer_version" {
  type = string
}

variable "agent_version" {
  type = string
}

variable "service_name" {
  type    = string
  default = "portainer"
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
  default     = "9000"
}
