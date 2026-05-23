output "web_ips" {
  value = [for c in docker_container.web : c.network_data[0].ip_address]
}

output "web_urls" {
  value = [for i in range(var.web_count) : "http://localhost:${var.external_port_start + i}"]
}
