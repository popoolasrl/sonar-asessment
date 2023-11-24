#!/bin/bash
# install httpd (Linux 2 version)
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello World!</h1>" > /var/www/html/index.html
