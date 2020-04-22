variable "drone_version" {
  type    = string
  default = "1.7.0"
}

variable "drone_runner_version" {
  type    = string
  default = "1.3"
}

variable "service_name" {
  type        = string
  default     = "drone"
  description = "The prefix to use for docker_service resources in this module"
}

variable "runner_capacity" {
  type        = string
  default     = "2"
  description = "Limits the number of concurrent pipelines that a runner can execute."
}

variable "gitea_network" {
  type        = string
  description = "The network ID to allow service access to Gitea"
}

variable "gitea_server" {
  type        = string
  description = "Gitea server address. ex: https://gitea.company.com"
}

variable "gitea_client_id" {
  type        = string
  description = "Gitea OAuth client ID"
}

variable "gitea_client_secret" {
  type        = string
  description = "Gitea OAuth client secret"
}

variable "rpc_secret" {
  type        = string
  description = "This is used to authenticate the rpc connection between the server and runners. The server and runner must be provided the same secret value."
}

variable "server_host" {
  type        = string
  description = "External hostname or IP address. Used for clone URLs"
}

variable "server_proto" {
  type        = string
  description = "This value should be set to http or https. This field defaults to https if you configure ssl or acme."
}

variable "traefik_network" {
  type        = string
  description = "The traefik network ID to use for load balancing."
}

variable "initial_user" {
  type        = string
  description = "The initial administrative account to create"
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
  default     = "80"
}

variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}
