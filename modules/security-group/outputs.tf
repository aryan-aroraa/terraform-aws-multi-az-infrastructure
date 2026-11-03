output "alb_security_group_id" {
  value = aws_security_group.public_alb_sg.id
}

output "ec2_security_group_id" {
  value = aws_security_group.private_ec2_sg.id
}

