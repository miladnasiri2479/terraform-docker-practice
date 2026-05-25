# # environments/prod/providers.tf

# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#       version = "~> 3.0.0"
#     }
#   }
# }

# # Logic baraye detect kardan-e OS
# locals {
#   is_windows          = substr(abspath(path.root), 1, 1) == ":"
#   default_docker_host = local.is_windows ? "npipe:////./pipe/docker_engine" : "unix:///var/run/docker.sock"
# }

# provider "docker" {
#   host = var.docker_host != null ? var.docker_host : local.default_docker_host
# }

# /*
# # AWS Provider Example (Prod)
# ...

#   region = "us-east-1"
# }

# # Kubernetes Provider Example (Prod)
# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }
# */
