resource "docker_volume" "db_data" {
  name = var.db_volume_name
}

resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = true
}

resource "docker_container" "db" {
  name  = var.db_container_name
  image = docker_image.postgres.image_id

  networks_advanced {
    name = var.network_name
  }

  env = [
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=${var.db_name}"
  ]

  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/postgresql/data"
  }

  restart = "always"

  lifecycle {
    create_before_destroy = true
  }
}
