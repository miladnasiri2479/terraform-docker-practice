# Root Configuration

# 1. Local Variables
# Dar in ghesmat tanzimate har environment (dev/prod) ra tarif mikonim.
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

  # Entekhabe config bar asase workspace-e jari (ba fallback be default)
  workspace_config = lookup(local.env, terraform.workspace, local.env["default"])

  # Prefix baraye jodasazi-ye resource-haye har environment dar docker
  resource_prefix = "${var.project_name}_${terraform.workspace}"
}

# 2. Network Module
# Sakhte shabakeye dakheliye dacker baraye ertebat-e amne kantenir-ha.
module "network" {
  source       = "./modules/network"
  network_name = "${local.resource_prefix}_network"
}

# 3. Database Module
# Rah-andaziye kantenir-haye database ba dade-haye paydar.
module "db" {
  source            = "./modules/db"
  network_name      = module.network.network_name
  db_volume_name    = "${local.resource_prefix}_db_data"
  db_container_name = "${local.resource_prefix}_db"
  db_user           = var.db_user
  db_password       = var.db_password
  db_name           = var.db_name
  db_image          = var.db_image
  db_image_tag      = var.db_image_tag
}

# 4. Web Module
# Rah-andaziye kantenir-haye web (Nginx) ba ghabeliate scale-up.
module "web" {
  source               = "./modules/web"
  network_name         = module.network.network_name
  web_count            = local.workspace_config.web_count
  external_port_start  = local.workspace_config.external_port_start
  web_container_prefix = "${local.resource_prefix}_web"
  web_image            = var.web_image
  web_image_tag        = var.web_image_tag
}

# 5. Ansible Inventory Generation
# Sakhte khodkare inventory file baraye modiriate kantenir-ha tavasote Ansible.
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/inventory.ini"
  content  = <<EOT
[webservers]
%{for ip in module.web.web_ips~}
${ip}
%{endfor~}

[dbservers]
%{for ip in module.db.db_ips~}
${ip}
%{endfor~}
EOT
}
