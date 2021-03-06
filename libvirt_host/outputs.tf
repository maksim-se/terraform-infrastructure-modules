output "networks" {
  value = {
    for name, id in zipmap(sort(var.networks[*].name), sort(values(libvirt_network.network)[*].id)) : name => { "name" = name, "id" = id }
  }
  description = "Networks available on the librit host."
}

output "pools" {
  value = {
    for name, id in zipmap(sort(var.pools[*].name), sort(values(libvirt_pool.pool)[*].id)) : name => { "name" = name, "id" = id }
  }
  description = "Storage pools available on the libvirt host."
}

output "images" {
  value       = module.images.images
  description = "Images available on the libvirt host."
}
