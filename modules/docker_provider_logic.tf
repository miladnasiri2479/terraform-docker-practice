# platform_agnostic_provider.tf

# In logic check mikone ke age system Windows bood az npipe estefade kone,
# dar gheyr-e in soorat az unix socket (Linux/Mac).
locals {
  is_windows = length(regexall("^C:", abspath(path.root))) > 0
  default_docker_host = local.is_windows ? "npipe:////./pipe/docker_engine" : "unix:///var/run/docker.sock"
}

# Inja mitoni ba environment variable-e 'DOCKER_HOST' ham override-esh koni.
provider "docker" {
  host = coalesce(var.docker_host_override, local.default_docker_host)
}

variable "docker_host_override" {
  type    = string
  default = null
}
