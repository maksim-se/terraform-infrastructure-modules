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
| images | A list of images to dowload to the libvirt server | <pre>list(object({<br>    name   = string<br>    source = string<br>    format = string<br>  }))</pre> | `[]` | no |
| pool | The pool to store the images in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| images | The images created by this module. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
