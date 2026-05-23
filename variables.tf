# Root Variables

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "my_app"
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "DB name"
  type        = string
  default     = "app_db"
}

variable "db_user" {
  description = "DB user"
  type        = string
  default     = "app_user"
}
