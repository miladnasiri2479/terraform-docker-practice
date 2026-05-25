# 1. Database Storage (Volumes)
# In ghesmat baraye har container yek volume jodagane misaze ta dade-ha ba restart hazf nashan.
resource "docker_volume" "db_data" {
  for_each = { for i in range(var.db_count) : i => i }
  name     = "${var.db_volume_name}_${each.key}"
}

# 2. Database Image
# Download va modiriate image PostgreSQL.
resource "docker_image" "postgres" {
  name         = "${var.db_image}:${var.db_image_tag}"
  keep_locally = true
}

# 3. Database Containers
# Sakht container-ha ba tanzimati mesle Network, Environment Variables va Healthcheck.
resource "docker_container" "db" {
  for_each = { for i in range(var.db_count) : i => i }
  
  name  = var.db_count > 1 ? "${var.db_container_name}_${each.key}" : var.db_container_name
  image = "${var.db_image}:${var.db_image_tag}"

  networks_advanced {
    name = var.network_name
  }

  # Tenzimate daitabase (User/Pass/DB Name)
  env = [
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=${var.db_name}"
  ]

  # Mount kardane volume baraye paydari dade-ha
  volumes {
    volume_name    = docker_volume.db_data[each.key].name
    container_path = "/var/lib/postgresql/data"
  }

  # Healthcheck baraye etminan az amade bodane database
  healthcheck {
    test     = ["CMD-SHELL", "pg_isready -U ${var.db_user} -d ${var.db_name}"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }

  restart = "always"

  lifecycle {
    create_before_destroy = true
  }
}
