#!/bin/bash

yum update -y
yum install -y docker
service docker start
usermod -a -G docker ec2-user
docker run --rm cfdair/download_uk_traffic_data

(crontab -l 2>/dev/null; echo "0 0 1 * * /usr/bin/docker rmi cfdair/download_uk_traffic_data; /usr/bin/docker run --rm cfdair/download_uk_traffic_data") | crontab -
