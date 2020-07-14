# Terraform Infrastructure Modules

Implementation of https://terragrunt.gruntwork.io/docs/features/keep-your-terraform-code-dry/

* [libvirt_host](./libvirt_host/README.md): Defines a libvirt host's pools, networks, and available images.
* [libvirt_vm](./minio/README.md): Defines KVM instances on a libvirt host.
Allows usage of pools, networks, and images defined by the output of [libvirt_host](./libvirt_host/README.md).


## Requirements
* [libvirt](https://libvirt.org/)
* [terraform](https://terraform.io)
* [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)
* [terragrunt](https://terragrunt.gruntwork.io/)
