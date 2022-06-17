# --- compute/asg.tf ---

# create a launch configuration
resource "aws_launch_configuration" "webserver_launch_template" {
  name_prefix     = "webserver_launch-"
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = ["aws_security_group.webserver_security_group.id"]

  user_data = file("apache.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# create auto scaling group
resource "aws_autoscaling_group" "auto_scaling_group" {
  desired_capacity     = 3
  max_size             = 5
  min_size             = 2
  health_check_type    = "EC2"
  load_balancers       = ["aws_lb.bastion_lb.id"]
  launch_configuration = "aws_launch_configuration.webserver_launch_configuration.id"
  vpc_zone_identifier  = ["aws_subnet.public_subnet_az1.id", "aws_subnet.public_subnet_az2.id"]
  metrics_granularity  = "1Minute"

  lifecycle {
    create_before_destroy = true
  }
}

