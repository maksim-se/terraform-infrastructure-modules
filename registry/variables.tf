variable "registry_version" {
  type    = string
  default = "2"
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
