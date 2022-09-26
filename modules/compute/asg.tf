# --- compute/asg.tf ---

# create a launch template
resource "aws_launch_template" "web_launch_template" {
  name                   = "web-server-template"
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.web_security_group]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = "${base64encode(file("apache.sh"))}"
}

resource "aws_launch_template" "app_launch_template" {
  name                   = "app-server-template"
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.web_security_group]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = "${base64encode(file("apache.sh"))}"
}

resource "aws_autoscaling_group" "auto_scaling_group_1" {
  max_size                  = 5
  min_size                  = 2
  desired_capacity          = 4
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = [var.public_subnet_az1, var.public_subnet_az2]

  launch_template {
    id = aws_launch_template.web_launch_template.id
  }
}

resource "aws_autoscaling_group" "auto_scaling_group_2" {
  max_size                  = 5
  min_size                  = 2
  desired_capacity          = 4
  health_check_type         = "EC2"
  health_check_grace_period = 300
  vpc_zone_identifier       = [var.private_app_subnet_az1, var.private_app_subnet_az2]

  launch_template {
    id = aws_launch_template.app_launch_template.id
  }
}

resource "aws_autoscaling_attachment" "lb_attach_1" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group_1.id
  lb_target_group_arn    = aws_lb_target_group.alb_tg.id
}

resource "aws_autoscaling_attachment" "lb_attach_2" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group_2.id
  lb_target_group_arn    = aws_lb_target_group.alb_tg.id
}



