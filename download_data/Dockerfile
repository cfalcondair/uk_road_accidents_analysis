FROM alpine

WORKDIR /usr/src/app/

RUN apk update
RUN apk add \
    wget \
    curl \
    unzip

ADD download.sh /usr/src/app/download.sh

CMD sh download.sh
