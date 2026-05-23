resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "web" {
  count = var.web_count
  
  name  = "${var.web_container_prefix}_${count.index}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 80
    external = var.external_port_start + count.index
  }

  lifecycle {
    create_before_destroy = true
  }
}
