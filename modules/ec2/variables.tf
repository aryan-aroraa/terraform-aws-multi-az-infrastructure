variable "project_name" {
  description = "Resource naming"
  type        = string
}

variable "environment" {
  description = "Environment tagging"
  type        = string
}

# variable "ami_id" {
#   description = "EC2 operating system image"
#   type = string
# }

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
}

variable "private_subnet_1_id" {
  description = "First AZ placement"
  type        = string
}
variable "private_subnet_2_id" {
  description = "Second AZ placement"
  type        = string
}

variable "ec2_security_group_id" {
  description = "Instance security"
  type        = string
}

variable "instance_profile_name" {
  description = "SSM access"
  type        = string
}

