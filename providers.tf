# Docker provider configuration
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Explanation:
# The 'provider' block configures how Terraform connects to the target API.
# 'npipe:////./pipe/docker_engine' is the default named pipe for Docker Desktop on Windows.
# In production (Linux), this would typically be 'unix:///var/run/docker.sock'.
