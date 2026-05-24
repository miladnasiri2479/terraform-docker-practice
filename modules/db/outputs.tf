output "db_container_names" {
  value = [for d in docker_container.db : d.name]
}

output "db_ips" {
  description = "List of all database IP addresses"
  value       = [for d in docker_container.db : d.network_dat a[0].ip_address]
}
