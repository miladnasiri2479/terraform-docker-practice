# Root Outputs

output "environment" {
  value = terraform.workspace
}

output "web_urls" {
  description = "URLs for the web containers"
  value       = module.web.web_urls
}

output "all_container_ips" {
  description = "Map of all container IPs in the network"
  value = {
    database = module.db.db_ips
    web      = module.web.web_ips
  }
}

output "db_details" {
  value = {
    container_names = module.db.db_container_names
  }
}
