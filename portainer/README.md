<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| docker | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| agent\_version | n/a | `string` | n/a | yes |
| app\_domain | The domain to use for the Traefik routing label | `string` | n/a | yes |
| gluster\_volume | GlusterFS volume mount | `string` | n/a | yes |
| portainer\_version | n/a | `string` | n/a | yes |
| service\_name | n/a | `string` | `"portainer"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"9000"` | no |
| traefik\_network | n/a | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
