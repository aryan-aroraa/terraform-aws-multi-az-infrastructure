resource "aws_lb" "public_alb" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]
}

resource "aws_lb_target_group" "public_alb_tg" {
  name        = "${var.project_name}-tg"
  protocol    = "HTTP"
  port        = 80
  target_type = "instance"
  vpc_id      = var.vpc_id


  health_check {
    enabled = true
    path    = "/"
    matcher = "200"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2-alb-tg-attachment-1" {
  target_group_arn = aws_lb_target_group.public_alb_tg.arn
  target_id        = var.instance_1_id
  port             = 80
}
resource "aws_lb_target_group_attachment" "ec2-alb-tg-attachment-2" {
  target_group_arn = aws_lb_target_group.public_alb_tg.arn
  target_id        = var.instance_2_id
  port             = 80
}