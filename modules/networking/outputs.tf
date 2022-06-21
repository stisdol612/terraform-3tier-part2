# --- vpc/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnet_az1" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2" {
  value = aws_subnet.public_subnet_az2.id
}

output "private_app_subnet_az1" {
  value = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2" {
  value = aws_subnet.private_app_subnet_az2.id
}

output "web_security_group" {
  value = aws_security_group.webserver_security_group.id
}

output "alb_security_group" {
  value = aws_security_group.alb_security_group.id
}