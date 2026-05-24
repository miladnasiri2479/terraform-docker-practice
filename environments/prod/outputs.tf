# environments/prod/outputs.tf

output "web_urls" {
  value = module.web.web_urls
}

output "all_ips" {
  value = {
    db  = module.db.db_ips
    web = module.web.web_ips
  }
}
