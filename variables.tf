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

variable "db_image" {
  default = "mysql"
}

variable "db_image_tag" {
  default = "5.7"
}

variable "web_image" {
  default = "nginx"
}

variable "web_image_tag" {
  default = "alpine"
}