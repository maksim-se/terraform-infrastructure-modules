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
| data\_volume\_nfs\_path | NFS path for local volume driver | `string` | n/a | yes |
| gid | The GID to run the container process | `string` | `"1000"` | no |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"syncthing"` | no |
| syncthing\_version | n/a | `string` | `"1.4.2"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"8384"` | no |
| traefik\_network | The traefik network ID to use for load balancing. | `string` | n/a | yes |
| traefik\_tcp\_discovery\_port | TCP port for loadbalancing of local discovery | `string` | `"22000"` | no |
| uid | The UID to run the container process | `string` | `"1000"` | no |
| volume\_nfs\_addr | NFS address for local volume driver | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
