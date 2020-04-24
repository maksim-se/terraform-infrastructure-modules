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
| api\_insecure | Activate API directly on the entryPoint named traefik. | `bool` | `false` | no |
| args | Additional command arguments to pass traefik. https://docs.traefik.io/v2.0/reference/static-configuration/cli/ | `list(string)` | `[]` | no |
| docker\_socket\_proxy\_version | n/a | `string` | `"latest"` | no |
| entrypoints\_web\_address | web Entry point address. | `string` | `":80"` | no |
| providers\_docker\_exposed\_by\_default | Expose containers by default through Traefik. If set to false, containers that don't have a traefik.enable=true label will be ignored from the resulting routing configuration. | `bool` | `true` | no |
| providers\_docker\_swarm\_mode | Activates the Swarm Mode (instead of standalone Docker). | `bool` | `true` | no |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"traefik"` | no |
| traefik\_network\_name | Name of the docker\_network resource to create for Traefik | `string` | `"traefik"` | no |
| traefik\_version | n/a | `string` | `"v2.2.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_id | The docker\_network ID for other services to use to communicate with Traefik |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
