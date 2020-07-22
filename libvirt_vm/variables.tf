variable "name" {
  type        = string
  description = "Virtual machine name"
}

variable "instances" {
  type        = number
  description = "Number of instances to create"
  default     = 1
}

variable "memory" {
  type        = number
  default     = 512
  description = "The amount of memory in MB"
}

variable "vcpu" {
  type        = number
  default     = 1
  description = "The number of virtual CPUs."
}

variable "autostart" {
  type        = bool
  description = "Enable/Disable autostart of the VM on host boot"
  default     = true
}

variable "networks" {
  type = list(object({
    network_id    = string,
    interface     = string,
    prefix        = string,
    hostnum_start = number,
    gateway       = string,
    nameservers   = list(string),
    domain        = string
  }))
  description = "List of networks to configure"
  default     = []
}

variable "os_image" {
  type = object({
    image_volume_id = string
    size            = number
    pool            = string
    format          = string
  })
}

variable "additional_volumes" {
  type = set(object({
    name   = string
    size   = number
    pool   = string
    format = string
  }))
  default = []
}

variable "cloud_init_pool" {
  type = string
}

variable "initial_user" {
  type = object({
    username = string,
    gecos    = string,
    groups   = set(string),
    shell    = string,
    sudo     = string,
    ssh_keys = set(string)
  })
}
