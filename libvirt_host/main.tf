resource "libvirt_network" "network" {
  for_each  = { for network in var.networks : network.name => network }
  name      = each.value.name
  autostart = true
  mode      = "bridge"
  bridge    = each.value.bridge
}

resource "libvirt_pool" "pool" {
  for_each = { for pool in var.pools : pool.name => pool }
  name     = each.value.name
  type     = "dir"
  path     = each.value.path
}

module "images" {
  source = "./modules/images"
  pool   = var.image_pool
  images = var.images
}
