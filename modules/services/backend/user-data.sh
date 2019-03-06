#!/bin/sh
yum update -y
yum install httpd -y
echo "hello" > /var/www/html/index.html
systemctl start httpd
chkconfig httpd on
