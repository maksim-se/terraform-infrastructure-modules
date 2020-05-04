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
| drone\_runner\_version | n/a | `string` | `"1.3"` | no |
| drone\_version | n/a | `string` | `"1.7.0"` | no |
| gitea\_client\_id | Gitea OAuth client ID | `string` | n/a | yes |
| gitea\_client\_secret | Gitea OAuth client secret | `string` | n/a | yes |
| gitea\_network | The network ID to allow service access to Gitea | `string` | n/a | yes |
| gitea\_server | Gitea server address. ex: https://gitea.company.com | `string` | n/a | yes |
| gluster\_volume | GlusterFS volume mount | `string` | n/a | yes |
| initial\_user | The initial administrative account to create | `string` | n/a | yes |
| rpc\_secret | This is used to authenticate the rpc connection between the server and runners. The server and runner must be provided the same secret value. | `string` | n/a | yes |
| runner\_capacity | Limits the number of concurrent pipelines that a runner can execute. | `string` | `"2"` | no |
| server\_host | External hostname or IP address. Used for clone URLs | `string` | n/a | yes |
| server\_proto | This value should be set to http or https. This field defaults to https if you configure ssl or acme. | `string` | n/a | yes |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"drone"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"80"` | no |
| traefik\_network | The traefik network ID to use for load balancing. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
