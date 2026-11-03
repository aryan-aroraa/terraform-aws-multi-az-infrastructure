variable "vpc_id" {
  description = "VPC ID for the endpoints"
  type        = string
}

variable "private_subnet_1_id" {
  description = "First private subnet ID"
  type        = string
}

variable "private_subnet_2_id" {
  description = "Second private subnet ID"
  type        = string
}

variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
}

variable "environment" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}