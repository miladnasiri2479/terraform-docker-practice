output "db_container_name" {
  value = docker_container.db.name
}

output "db_ip" {
  value = docker_container.db.network_data[0].ip_address
}
