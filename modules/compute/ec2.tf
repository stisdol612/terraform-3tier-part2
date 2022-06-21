# ---compute/ec2.tf ---

resource "aws_instance" "web_az1" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["var.webserver_security_group"]
  subnet_id = var.public_subnet_az1
    depends_on = [
      var.public_subnet_az1
    ]
}

resource "aws_instance" "web_az2" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["var.webserver_security_group"]
  subnet_id = var.public_subnet_az2
}

resource "aws_instance" "app_az1" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["var.webserver_security_group"]
  subnet_id = var.private_app_subnet_az1
}

resource "aws_instance" "app_az2" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["var.webserver_security_group"]
  subnet_id = var.private_app_subnet_az2
}