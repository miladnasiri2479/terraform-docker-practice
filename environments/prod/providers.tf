# environments/prod/providers.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

/*
# AWS Provider Example (Prod)
provider "aws" {
  region = "us-east-1"
}

# Kubernetes Provider Example (Prod)
provider "kubernetes" {
  config_path = "~/.kube/config"
}
*/
