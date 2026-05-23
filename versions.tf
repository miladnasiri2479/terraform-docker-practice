# Terraform settings and required providers
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Explanation:
# The 'terraform' block is used to configure Terraform itself.
# In a real-world DevOps environment, 'required_version' ensures all team members
# use the same Terraform binary, avoiding configuration drift.
# The 'required_providers' block tells Terraform to download the Docker provider
# from the HashiCorp registry so it can talk to your Docker Engine.
