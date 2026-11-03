data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2-instance-1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id                   = var.private_subnet_1_id
  iam_instance_profile        = var.instance_profile_name
  vpc_security_group_ids      = [var.ec2_security_group_id]
  associate_public_ip_address = false

  tags = {
    Name        = "${var.project_name}-ec2-1"
    Environment = var.environment
  }
}
resource "aws_instance" "ec2-instance-2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id                   = var.private_subnet_2_id
  iam_instance_profile        = var.instance_profile_name
  vpc_security_group_ids      = [var.ec2_security_group_id]
  associate_public_ip_address = false

  tags = {
    Name        = "${var.project_name}-ec2-2"
    Environment = var.environment
  }
}