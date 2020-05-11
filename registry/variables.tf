variable "registry_version" {
  type    = string
  default = "2"
}

variable "registry_ui_version" {
  type    = string
  default = "2.0.2"
}

variable "ui_registry_host" {
  type        = string
  description = "The registry hostname and optional port to connect to for API calls"
}

variable "ui_registry_ssl" {
  type        = bool
  default     = false
  description = "Specify true for this if the registry is accessed via HTTPS"
}

variable "ui_registry_domain" {
  type        = string
  description = "This is the registry domain to display in the UI for example push/pull code"
}

variable "storage_delete_enabled" {
  type        = bool
  default     = false
  description = "See: https://github.com/jc21/docker-registry-ui#deletion-support"
}

variable "service_name" {
  type        = string
  default     = "registry"
  description = "The prefix to use for docker_service resources in this module"
}

variable "traefik_network" {
  type        = string
  description = "The traefik network ID to use for load balancing."
}

variable "traefik_http_port" {
  type        = string
  description = "HTTP port for traefik load balancing"
  default     = "5000"
}

variable "traefik_http_ui_port" {
  type        = string
  description = "HTTP port for traefik load balancing of UI"
  default     = "80"
}

variable "app_domain" {
  type        = string
  description = "The domain to use for the Traefik routing label"
}

variable "s3_accesskey" {
  type        = string
  description = "Your AWS Access Key. If you use IAM roles, omit to fetch temporary credentials from IAM."
}

variable "s3_secretkey" {
  type        = string
  description = "Your AWS Secret Key. If you use IAM roles, omit to fetch temporary credentials from IAM."
}

variable "s3_region" {
  type        = string
  description = "The AWS region in which your bucket exists. For the moment, the Go AWS library in use does not use the newer DNS based bucket routing."
}

variable "s3_regionendpoint" {
  type        = string
  description = "Endpoint for S3 compatible storage services (Minio, etc)."
}

variable "s3_bucket" {
  type        = string
  description = "The bucket name in which you want to store the registry’s data."
}
