#!/bin/sh sh
# encoding: utf-8

echo "Downloading data"
FILE_NAME=Stats19-Data1979-2004.zip
URL=http://data.dft.gov.uk/road-accidents-safety-data/$FILE_NAME

echo "Retrieving file from "$URL
wget -P /tmp/ $URL

echo "Unzipping file..."
unzip /tmp/$FILE_NAME
rm -f /tmp/$FILE_NAME

echo "Download complete."
