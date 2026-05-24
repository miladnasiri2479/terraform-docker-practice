resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "web" {
  # Convert count to a map for for_each
  for_each = { for i in range(var.web_count) : i => i }
  
  name  = "${var.web_container_prefix}_${each.key}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 80
    external = var.external_port_start + each.value
  }

  # Healthcheck for Observability
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost"]
    interval = "30s"
    retries  = 3
    timeout  = "10s"
  }

  lifecycle {
    create_before_destroy = true
  }
}
