variable "syncthing_version" {
  type    = string
  default = "1.4.2"
}

variable "uid" {
  type        = string
  default     = "1000"
  description = "The UID to run the container process"
}

variable "gid" {
  type        = string
  default     = "1000"
  description = "The GID to run the container process"
}

variable "service_name" {
  type        = string
  default     = "syncthing"
  description = "The prefix to use for docker_service resources in this module"
}

variable "traefik_network" {
  type        = string
  description = "The traefik network ID to use for load balancing."
}

variable "data_volume_nfs_path" {
  type        = string
  description = "NFS path for local volume driver"
}

variable "volume_nfs_addr" {
  type        = string
  description = "NFS address for local volume driver"
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "8384"
}

variable "traefik_tcp_discovery_port" {
  type        = string
  description = "TCP port for loadbalancing of local discovery"
  default     = "22000"
}

variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}
