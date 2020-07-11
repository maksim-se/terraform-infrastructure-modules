variable "pools" {
  type = list(object({
    name = string
    path = string
  }))
  default     = []
  description = "A list of pools to create. Only supports type 'dir'"
}

variable "networks" {
  type = list(object({
    name   = string
    bridge = string
  }))
  default     = []
  description = "A list of networks to create. Currently only supports pre-existing bridge interfaces."
}

variable "image_pool" {
  type        = string
  default     = null
  description = "The pool to store the images in."
}

variable "images" {
  type = list(object({
    name   = string
    source = string
    format = string
  }))
  default     = []
  description = "A list of images to dowload to the libvirt server"
}
