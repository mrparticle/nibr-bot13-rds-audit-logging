variable "AWS_SECRET_ACCESS_KEY" {
  default = ""
}

variable "AWS_ACCESS_KEY_ID" {
  default = ""
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}