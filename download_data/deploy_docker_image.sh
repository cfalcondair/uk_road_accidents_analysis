#!/bin/sh

echo "Ensure that the script has logged into the docker repository"

docker build . -t cfdair/download_uk_traffic_data
docker push cfdair/download_uk_traffic_data
