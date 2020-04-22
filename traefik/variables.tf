variable "traefik_version" {
  type    = string
  default = "v2.2.0"
}

variable "docker_socket_proxy_version" {
  type    = string
  default = "latest"
}

variable "traefik_network_name" {
  type        = string
  default     = "traefik"
  description = "Name of the docker_network resource to create for Traefik"
}

variable "service_name" {
  type        = string
  default     = "traefik"
  description = "The prefix to use for docker_service resources in this module"
}

variable "data_volume_nfs_path" {
  type        = string
  description = "NFS path for local volume driver"
}

variable "data_volume_nfs_addr" {
  type        = string
  description = "NFS address for local volume driver"
}

variable "api_insecure" {
  type        = bool
  description = "Activate API directly on the entryPoint named traefik."
  default     = false
}

variable "entrypoints_web_address" {
  type        = string
  description = "web Entry point address."
  default     = ":80"
}

variable "providers_docker_swarm_mode" {
  type        = bool
  description = "Activates the Swarm Mode (instead of standalone Docker)."
  default     = true
}

variable "providers_docker_exposed_by_default" {
  type        = bool
  description = "Expose containers by default through Traefik. If set to false, containers that don't have a traefik.enable=true label will be ignored from the resulting routing configuration."
  default     = true
}

variable "args" {
  type        = list(string)
  description = "Additional command arguments to pass traefik. https://docs.traefik.io/v2.0/reference/static-configuration/cli/"
  default     = []
}
