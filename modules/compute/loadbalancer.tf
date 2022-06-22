# --- compute/loadbalancer.tf ---

resource "aws_lb" "application_load_balancer" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]

  subnets = [var.public_subnet_az1, var.public_subnet_az2]

  enable_deletion_protection = false

  tags   = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  lifecycle {
    create_before_destroy = true
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "lb_tg_attach1" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id = aws_instance.web_az1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "lb_tg_attach2" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id = aws_instance.web_az2.id
  port = 80
}


