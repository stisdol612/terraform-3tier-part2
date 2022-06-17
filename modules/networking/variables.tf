# --- vpc/variables.tf ---

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
  default = "10.0.0.0/24"
  type    = string
}

variable "public_subnet_az2_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "private_app_subnet_az1_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "private_app_subnet_az2_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

variable "private_data_subnet_az1_cidr" {
  default = "10.0.4.0/24"
  type    = string
}

variable "private_data_subnet_az2_cidr" {
  default = "10.0.5.0/24"
  type    = string
}

variable "ssh_location" {
  default = "0.0.0.0/0"
  type    = string
}
