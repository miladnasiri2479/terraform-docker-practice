# environments/prod/variables.tf
variable "db_count" {
  type    = number
  default = 1
}

variable "env_prefix" { type = string }
...

variable "web_count" { type = number }
variable "external_port_start" { type = number }
variable "db_user" { type = string }
variable "db_password" { type = string }
variable "db_name" { type = string }
