output "images" {
  value = {
    for name, id in zipmap(sort(var.images[*].name), sort(values(libvirt_volume.image)[*].id)) : name => { "name" = name, "id" = id }
  }
  description = "The images created by this module."
}
