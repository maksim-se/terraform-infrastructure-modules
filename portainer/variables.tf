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

variable "data_volume_nfs_path" {
  type        = string
  description = "NFS path for local volume driver"
}

variable "data_volume_nfs_addr" {
  type        = string
  description = "NFS address for local volume driver"
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "9000"
}
