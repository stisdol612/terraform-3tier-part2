#!/bin/sh
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo amazon-linux-extras install epel -y
sudo yum install stress -y