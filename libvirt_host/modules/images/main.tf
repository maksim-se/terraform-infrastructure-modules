resource "libvirt_volume" "image" {
  for_each = { for image in var.images : image.name => image }
  name     = each.value.name
  pool     = var.pool
  source   = each.value.source
  format   = each.value.format
}
