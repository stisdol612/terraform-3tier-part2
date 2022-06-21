# --- compute/asg.tf ---

# create a launch template
resource "aws_launch_template" "web_launch_template" {
  name = "web-server-template"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.web_security_group]

  user_data = file("apache.sh")
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  max_size = 5
  min_size = 2
  desired_capacity = 3
  health_check_type = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier = [var.public_subnet_az1, var.public_subnet_az2]

  launch_template {
    id = aws_launch_template.web_launch_template.id
  }
}

resource "aws_autoscaling_attachment" "lb_attach" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
  lb_target_group_arn = aws_lb_target_group.alb_tg.id
}



