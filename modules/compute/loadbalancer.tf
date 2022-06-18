# --- compute/loadbalancer.tf ---

# resource "aws_lb" "application_load_balancer" {
#   name               = "ALB"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["module.networking.lb_security_group"]

#   subnets = ["module.networking.public_subnet_az1", "module.networking.public_subnet_az2"]

#   enable_deletion_protection = false

#   tags   = {
#     Name = "ALB"
#   }
# }

