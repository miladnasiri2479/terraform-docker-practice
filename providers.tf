# Docker provider configuration
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# --- Examples for other providers (Commented for educational purposes) ---

/*
# AWS Provider Example
# Baraye modiriyat-e resource-ha dar AWS (EC2, S3, etc.)
provider "aws" {
  region  = "us-east-1"
  profile = "default" # Profile-i ke tu ~/.aws/credentials set shode
}

# Kubernetes Provider Example
# Baraye modiriyat-e Cluster-e K8s (Deployments, Services, etc.)
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}

# Helm Provider Example
# Baraye nasb-e Chart-haye Helm ruye K8s
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
*/

# Explanation:
# The 'provider' block configures how Terraform connects to the target API.
# 'npipe:////./pipe/docker_engine' is the default named pipe for Docker Desktop on Windows.
# In production (Linux), this would typically be 'unix:///var/run/docker.sock'.
