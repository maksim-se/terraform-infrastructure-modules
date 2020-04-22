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
| access\_key | Minio Admin Access Key | `string` | n/a | yes |
| app\_domain | The domain to use for the Traefik routing label | `string` | n/a | yes |
| data\_volume\_nfs\_addr | NFS address for local volume driver | `string` | n/a | yes |
| data\_volume\_nfs\_path | NFS path for local volume driver | `string` | n/a | yes |
| minio\_version | n/a | `string` | `"RELEASE.2020-04-15T19-42-18Z"` | no |
| secret\_key | Minio Admin Secret Key | `string` | n/a | yes |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"minio"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"9000"` | no |
| traefik\_network | The traefik network ID to use for load balancing. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
