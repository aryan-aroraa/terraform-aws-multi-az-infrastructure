resource "aws_security_group" "private_ec2_sg" {
  name        = "public-ec2-sg"
  description = "Public EC2 security group"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-sg"
    Environment = var.environment
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_http_from_alb" {
  security_group_id            = aws_security_group.private_ec2_sg.id
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.public_alb_sg.id
  from_port                    = 80
  to_port                      = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.private_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}

resource "aws_security_group" "public_alb_sg" {
  name        = "public-alb-sg"
  description = "Public ALB security group"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-alb-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_allow_all_ipv4" {
  security_group_id = aws_security_group.public_alb_sg.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb_allow_all_traffic" {
  security_group_id = aws_security_group.public_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}