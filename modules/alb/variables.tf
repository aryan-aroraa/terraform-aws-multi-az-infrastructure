variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Working environment name"
  type        = string
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "public_subnet_1_id" {
  type = string
}
variable "public_subnet_2_id" {
  type = string
}

variable "vpc_id" {
  type = string
}