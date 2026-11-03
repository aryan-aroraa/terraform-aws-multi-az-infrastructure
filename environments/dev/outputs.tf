output "vpc_id" {
  description = "Output VPC ID"
  value       = module.vpc.vpc_id
}
output "vpc_cidr" {
  description = "Output VPC CIDR"
  value       = module.vpc.vpc_cidr
}
output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "instance_1_id" {
  value = module.ec2.instance_1_id
}
output "instance_2_id" {
  value = module.ec2.instance_2_id
}