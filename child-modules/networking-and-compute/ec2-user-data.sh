#!/bin/bash
yum update -y
yum install -y git
yum install -y httpd
cd /var/www/html
git clone https://bitbucket.org/dptrealtime/html-web-app.git
cp -a /var/www/html/html-web-app/.  /var/www/html
rm -r html-web-app/
systemctl start httpd 
systemctl enable httpd

