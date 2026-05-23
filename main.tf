# Root Configuration

locals {
  # Define environment-specific configurations
  env = {
    default = {
      web_count           = 1
      external_port_start = 8080
    }
    dev = {
      web_count           = 2
      external_port_start = 8080
    }
    prod = {
      web_count           = 4
      external_port_start = 9090
    }
  }

  # Select config based on current workspace, fallback to default
  workspace_config = lookup(local.env, terraform.workspace, local.env["default"])

  # Prefix for all resources to ensure environment isolation
  resource_prefix = "${var.project_name}_${terraform.workspace}"
}

# 1. Network Module
module "network" {
  source       = "./modules/network"
  network_name = "${local.resource_prefix}_network"
}

# 2. Database Module
module "db" {
  source            = "./modules/db"
  network_name      = module.network.network_name
  db_volume_name    = "${local.resource_prefix}_db_data"
  db_container_name = "${local.resource_prefix}_db"
  db_user           = var.db_user
  db_password       = var.db_password
  db_name           = var.db_name
}

# 3. Web Module
module "web" {
  source               = "./modules/web"
  network_name         = module.network.network_name
  web_count            = local.workspace_config.web_count
  external_port_start  = local.workspace_config.external_port_start
  web_container_prefix = "${local.resource_prefix}_web"
}
