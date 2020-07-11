<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| libvirt | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| image\_pool | The pool to store the images in. | `string` | `null` | no |
| images | A list of images to dowload to the libvirt server | <pre>list(object({<br>    name   = string<br>    source = string<br>    format = string<br>  }))</pre> | `[]` | no |
| networks | A list of networks to create. Currently only supports pre-existing bridge interfaces. | <pre>list(object({<br>    name   = string<br>    bridge = string<br>  }))</pre> | `[]` | no |
| pools | A list of pools to create. Only supports type 'dir' | <pre>list(object({<br>    name = string<br>    path = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| images | n/a |
| networks | n/a |
| pools | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
