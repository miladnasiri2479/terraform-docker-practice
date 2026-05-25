# 1. Web Image
# Modiriate image Nginx baraye web server-ha.
resource "docker_image" "nginx" {
  name         = "${var.web_image}:${var.web_image_tag}"
  keep_locally = true
}

# 2. Web Containers
# Sakht kantenir-haye Nginx be tedad moshakhas shode (web_count).
resource "docker_container" "web" {
  # Tabdil count be map baraye estefade dar for_each (herfei tar az count)
  for_each = { for i in range(var.web_count) : i => i }
  
  name  = "${var.web_container_prefix}_${each.key}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = var.network_name

  }

  # Tanzimate port-haye kantenir (Mapping be port-haye host)
  ports {
    internal = 80
    external = var.external_port_start + each.value
  }

  # Healthcheck baraye monitor kerdane vaziat-e service-e Nginx
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
