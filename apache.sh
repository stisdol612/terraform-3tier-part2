#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo firewall-cmd — permanent — add-service=http
sudo firewall-cmd — reload
sudo amazon-linux-extras install epel -y
sudo yum install stress -y