# --- compute/loadbalancer.tf ---

# resource "aws_lb" "application_load_balancer" {
#   name               = "ALB"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["aws_security_group.alb_security_group.id"]

#   subnets = ["aws_subnet.public_subnet_az1.id", "aws_subnet.public_subnet_az2.id"]

#   enable_deletion_protection = false

#   tags   = {
#     Name = "ALB"
#   }
# }

