# environments/dev/main.tf

module "network" {
  source       = "../../modules/network"
  network_name = "${var.env_prefix}_network"
}

module "db" {
  source            = "../../modules/db"
  db_count          = var.db_count
  network_name      = module.network.network_name
  db_volume_name    = "${var.env_prefix}_db_data" 
  db_container_name = "${var.env_prefix}_db"
  db_user           = var.db_user
  db_password       = var.db_password
  db_name           = var.db_name
}

module "web" {
  source               = "../../modules/web"
  network_name         = module.network.network_name
  web_count            = var.web_count
  external_port_start  = var.external_port_start
  web_container_prefix = "${var.env_prefix}_web"
}
