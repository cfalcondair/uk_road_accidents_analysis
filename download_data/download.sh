#!/bin/sh
# encoding: utf-8

echo "Downloading data"
FILE_NAME=Stats19-Data1979-2004.zip
URL=http://data.dft.gov.uk/road-accidents-safety-data/$FILE_NAME

echo "Retrieving file from "$URL
wget -q -P /tmp/ $URL

echo "Unzipping file..."
mkdir -p /tmp/uk_road_accidents_data/
unzip /tmp/$FILE_NAME -d /tmp/uk_road_accidents_data/
rm -f /tmp/$FILE_NAME

echo "Download complete."

echo "Uploading data to s3"

aws s3 cp /tmp/uk_road_accidents_data/ s3://uk-traffic-data/ --recursive

rm -rf /tmp/uk_road_accidents_data/
