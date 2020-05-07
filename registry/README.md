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
| registry\_version | n/a | `string` | `"2"` | no |
| s3\_accesskey | Your AWS Access Key. If you use IAM roles, omit to fetch temporary credentials from IAM. | `string` | n/a | yes |
| s3\_bucket | The bucket name in which you want to store the registry’s data. | `string` | n/a | yes |
| s3\_region | The AWS region in which your bucket exists. For the moment, the Go AWS library in use does not use the newer DNS based bucket routing. | `string` | n/a | yes |
| s3\_regionendpoint | Endpoint for S3 compatible storage services (Minio, etc). | `string` | n/a | yes |
| s3\_secretkey | Your AWS Secret Key. If you use IAM roles, omit to fetch temporary credentials from IAM. | `string` | n/a | yes |
| service\_name | The prefix to use for docker\_service resources in this module | `string` | `"registry"` | no |
| traefik\_http\_port | HTTP port for traefik load balancing | `string` | `"5000"` | no |
| traefik\_network | The traefik network ID to use for load balancing. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
