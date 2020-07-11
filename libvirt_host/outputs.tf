output "networks" {
  value = {
    for name, id in zipmap(sort(var.networks[*].name), sort(values(libvirt_network.network)[*].id)) : name => { "name" = name, "id" = id }
  }
}

output "pools" {
  value = {
    for name, id in zipmap(sort(var.pools[*].name), sort(values(libvirt_pool.pool)[*].id)) : name => { "name" = name, "id" = id }
  }
}

output "images" {
  value = module.images.images
}
