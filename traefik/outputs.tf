output "network_id" {
  value       = docker_network.traefik.id
  description = "The docker_network ID for other services to use to communicate with Traefik"
}
