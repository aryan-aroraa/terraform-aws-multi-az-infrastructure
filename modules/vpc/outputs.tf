output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  description = "CIDR of VPC"
  value       = aws_vpc.my_vpc.cidr_block
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet.id
}
output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet.id
}
output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}