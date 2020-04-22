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
| app\_domain | The domain to use for the Traefik routing label | `string` | n/a | yes |
| data\_volume\_nfs\_addr | NFS address for local volume driver | `string` | n/a | yes |
| data\_volume\_nfs\_path | NFS path for local volume driver | `string` | n/a | yes |
| gitea\_version | n/a | `string` | n/a | yes |
| run\_mode | For performance and other purposes, change this to prod when deployed to a production environment. | `string` | `"prod"` | no |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"gitea"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"3000"` | no |
| traefik\_network | The traefik network ID to use for load balancing. | `string` | n/a | yes |
| user\_gid | The GID (Unix group ID) of the user that runs Gitea within the container. | `string` | `"1000"` | no |
| user\_uid | The UID (Unix user ID) of the user that runs Gitea within the container. | `string` | `"1000"` | no |

## Outputs

| Name | Description |
|------|-------------|
| gitea\_network | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
