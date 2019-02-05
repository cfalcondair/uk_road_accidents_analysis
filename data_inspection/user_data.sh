#!/bin/sh
# encoding: utf-8

sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

echo "Downloading data"
FILE_NAME=Stats19_Data_2005-2014.zip
URL=http://data.dft.gov.uk/road-accidents-safety-data/$FILE_NAME

echo "Retrieving file from "$URL
wget -q -P /tmp/ $URL

echo "Unzipping file..."
mkdir -p /tmp/uk_road_accidents_data/
unzip /tmp/$FILE_NAME -d /tmp/uk_road_accidents_data/
rm -f /tmp/$FILE_NAME

echo "Download complete."

docker run -d -p 9000:9000 -p 4040-4045:4040-4045 -v `pwd`:/opt/docker/notebooks/other -v /tmp/uk_road_accidents_data/:/tmp/data andypetrella/spark-notebook:0.9.0-SNAPSHOT-scala-2.11.8-spark-2.3.0-hadoop-2.7.2
