output "alb_dns_name" {
  value = aws_lb.public_alb.dns_name
}

output "alb_arn" {
  value = aws_lb.public_alb.arn
}

variable "instance_1_id" {
  type = string
}

variable "instance_2_id" {
  type = string
}