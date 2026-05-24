variable "db_count" {
  type        = number
  description = "Number of database instances"
  default     = 1

  validation {
    condition     = var.db_count >= 1
    error_message = "Database count must be at least 1."
  }
}

variable "db_volume_name" {}
variable "db_container_name" {}
variable "network_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_name" {}
