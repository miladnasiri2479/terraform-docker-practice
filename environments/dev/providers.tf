# environments/dev/providers.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Logic baraye detect kardan-e OS (Windows vs Linux/Mac)
locals {
  # Age masir ba / shoru she ya C: nadashte bashe, yani Linux/Mac e
  is_windows = substr(abspath(path.root), 1, 1) == ":"
  default_docker_host = local.is_windows ? "npipe:////./pipe/docker_engine" : "unix:///var/run/docker.sock"
}

provider "docker" {
  host = var.docker_host != null ? var.docker_host : local.default_docker_host
}

variable "docker_host" {
  type    = string
  default = null
}

/*
# AWS Provider Example (Dev)
...

  region = "eu-central-1"
}

# Kubernetes Provider Example (Dev)
provider "kubernetes" {
  config_path = "~/.kube/config"
}
*/
