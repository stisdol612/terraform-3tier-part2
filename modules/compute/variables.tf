# --- compute/variables.tf ---

variable "image_id" {
  default = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "week22"
}

variable "vpc_id" {}

variable "public_subnet_az1" {}

variable "public_subnet_az2" {}

variable "private_app_subnet_az1" {}

variable "private_app_subnet_az2" {}

variable "web_security_group" {}

variable "lb_security_group" {}