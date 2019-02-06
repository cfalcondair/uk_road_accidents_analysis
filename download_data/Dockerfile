FROM alpine

WORKDIR /usr/src/app/

RUN apk update
RUN apk add \
    wget \
    curl \
    unzip

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

ADD download.sh /usr/src/app/download.sh

CMD sh download.sh
