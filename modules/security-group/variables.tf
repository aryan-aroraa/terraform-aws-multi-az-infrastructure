variable "vpc_id" {
  type = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "Terraform-aws-infrastructure"
}

variable "environment" {
  description = "Working environment name"
  type        = string
  default     = "dev"
}