# --- compute/asg.tf ---

# create a launch template
resource "aws_launch_template" "web_launch_template" {
  name = "web-server-template"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = ["aws_security_group.web_security_group.id"]

  user_data = file("apache.sh")
}




