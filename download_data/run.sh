#!/bin/sh

docker build . -t download_data
docker run -v `pwd`/../data:/tmp download_data
