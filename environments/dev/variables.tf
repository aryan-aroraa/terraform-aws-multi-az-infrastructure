variable "aws_region" {
  description = "Region for the project"
  type        = string
  default     = "ap-south-1"
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

variable "vpc_cidr" {
  description = "CIDR of VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR of public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR of private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR of public subnet"
  type        = string
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR of private subnet"
  type        = string
  default     = "10.0.4.0/24"
}