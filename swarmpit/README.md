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
| agent\_version | n/a | `string` | `"2.2"` | no |
| app\_domain | The domain to use for the Traefik routing label | `string` | n/a | yes |
| couchdb\_version | n/a | `string` | `"2.3.0"` | no |
| gluster\_volume | GlusterFS volume mount | `string` | n/a | yes |
| influxdb\_version | n/a | `string` | `"1.7"` | no |
| service\_name | n/a | `string` | `"swarmpit"` | no |
| swarmpit\_version | n/a | `string` | `"1.9"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"8080"` | no |
| traefik\_network | n/a | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
