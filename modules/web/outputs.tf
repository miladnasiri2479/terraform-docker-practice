output "web_ips" {
  value = [for c in docker_container.web : c.network_data[0].ip_address]
}

output "web_urls" {
  value = [for k, v in docker_container.web : "http://localhost:${v.ports[0].external}"]
}
