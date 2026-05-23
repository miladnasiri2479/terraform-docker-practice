# environments/dev/outputs.tf

output "web_urls" {
  value = module.web.web_urls
}

output "all_ips" {
  value = {
    db  = module.db.db_ip
    web = module.web.web_ips
  }
}
