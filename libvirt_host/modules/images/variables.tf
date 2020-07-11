variable "pool" {
  type        = string
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
