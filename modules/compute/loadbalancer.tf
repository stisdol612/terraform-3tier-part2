# --- compute/loadbalancer.tf ---

resource "aws_lb" "application_load_balancer" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["var.lb_security_group"]

  subnets = [var.public_subnet_az1, var.public_subnet_az2]

  enable_deletion_protection = false

  tags   = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  target_type = "alb"
  port = 80
  protocol = "TCP"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "lb_tg_attach1" {
  target_group_arn = aws_lb_target_group.alb_tg.id
  target_id = aws_instance.web_az1.id
  port = 80

  depends_on = [
    aws_instance.web_az1,
  ]
}

resource "aws_lb_target_group_attachment" "lb_tg_attach2" {
  target_group_arn = aws_lb_target_group.alb_tg.id
  target_id = aws_instance.web_az2.id
  port = 80

  depends_on = [
    aws_instance.web_az2,
  ]
}
