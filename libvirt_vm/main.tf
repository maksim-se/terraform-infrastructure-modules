resource "libvirt_volume" "os" {
  count          = var.instances
  name           = "${var.name}${count.index + 1}"
  pool           = var.os_image.pool
  format         = var.os_image.format
  size           = var.os_image.size
  base_volume_id = var.os_image.image_volume_id
}

resource "libvirt_volume" "data" {
  for_each = {
    for item in setproduct(range(1, var.instances + 1), var.additional_volumes) :
    "${var.name}${item[0]}-${item[1].name}" => item[1]
  }
  name   = each.key
  pool   = each.value.pool
  size   = each.value.size
  format = each.value.format
}

resource "libvirt_cloudinit_disk" "cloud_init" {
  count = var.instances
  name  = "${var.name}${count.index + 1}-cloud-init.iso"
  pool  = var.cloud_init_pool
  user_data = templatefile(
    "./templates/cloud_config.cfg",
    {
      hostname     = "${var.name}${count.index + 1}"
      initial_user = var.initial_user
    }
  )
  network_config = templatefile(
    "./templates/network_config.cfg",
    {
      instance = count.index
      networks = var.networks
    }
  )
}

resource "libvirt_domain" "vm" {
  count      = var.instances
  name       = "${var.name}${count.index + 1}"
  memory     = var.memory
  vcpu       = var.vcpu
  autostart  = var.autostart
  qemu_agent = true

  cloudinit = libvirt_cloudinit_disk.cloud_init[count.index].id

  dynamic "network_interface" {
    for_each = var.networks
    content {
      network_id     = network_interface.value.network_id
      wait_for_lease = true
    }
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.os[count.index].id
  }

  dynamic "disk" {
    for_each = var.additional_volumes
    content {
      volume_id = libvirt_volume.data["${var.name}${count.index + 1}-${disk.value.name}"].id
    }
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
