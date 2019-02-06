FROM library/python:3.6.4

WORKDIR /opt/app

# Install terraform
ENV TERRAFORM_VERSION=0.11.7
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN apt-get update
RUN apt-get install -y zip unzip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY . /opt/app/
RUN terraform init
