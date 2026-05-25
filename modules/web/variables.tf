variable "web_count" {
  type        = number
  description = "Number of web containers"
  
  validation {
    condition     = var.web_count >= 1
    error_message = "Web count must be at least 1."
  }
}

variable "web_container_prefix" {
  type = string
}

variable "network_name" {
  type = string
}

variable "external_port_start" {
  type = number
}

variable "web_image" {
  type        = string
  description = "Docker image for the web server"
  default     = "nginx"
}

variable "web_image_tag" {
  type        = string
  description = "Docker image tag for the web server"
  default     = "alpine"
}

