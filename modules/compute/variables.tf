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

variable "vpc_id" {
  type = string
}

variable "public_subnet_az1" {
  type = string
}

variable "public_subnet_az2" {
  type = string
}

variable "private_app_subnet_az1" {
  type = string
}

variable "private_app_subnet_az2" {
  type = string
}

variable "web_security_group" {
  type = string
}

variable "lb_security_group" {
  type = string
}