# ---compute/ec2.tf ---

resource "aws_instance" "web_az1" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.web_security_group]
  subnet_id = var.public_subnet_az1
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name = var.key_name

  user_data = "${filebase64("apache.sh")}"
}

resource "aws_instance" "web_az2" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.web_security_group]
  subnet_id = var.public_subnet_az2
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name = var.key_name

  user_data = "${filebase64("apache.sh")}"
}

resource "aws_instance" "app_az1" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.web_security_group]
  subnet_id = var.private_app_subnet_az1
  key_name = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  user_data = "${filebase64("apache.sh")}"
}

resource "aws_instance" "app_az2" {
  ami = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.web_security_group]
  subnet_id = var.private_app_subnet_az2
  key_name = var.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  user_data = "${filebase64("apache.sh")}"
}