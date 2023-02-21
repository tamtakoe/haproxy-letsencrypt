FROM haproxy:latest

MAINTAINER MLC team
USER root

ENV APPLICATION_NAME=haproxy-letsencrypt
WORKDIR /opt/$APPLICATION_NAME

#Only full version of Node image has update-ca-certificates command.
#For other version of node images we should install it manually. E.g.
#FROM node:14-alpine as build-stage
#RUN apk update && apk add git
#RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

COPY ./ ./

RUN mkdir -p /var/lib/haproxy/haproxy_server_state
RUN mkdir -p /run/haproxy
RUN mkdir -p /etc/haproxy/certs/
#Create fake certificate to run Haproxy
RUN apt-get update
RUN apt-get install openssl
RUN openssl version
#RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/haproxy/certs/key.pem -out /etc/haproxy/certs/cert.pem -sha256 -days 3650 -subj '/CN=example.com' -nodes
RUN openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -subj '/CN=example.com' -keyout ./key.pem -out ./cert.pem
RUN cat ./key.pem ./cert.pem > /etc/haproxy/certs/example.com.pem
RUN rm ./key.pem ./cert.pem
RUN ls -la /etc/haproxy/certs/
#RUN cat /etc/haproxy/certs/example.com.pem

##
## Generate a unique private key (KEY)
#sudo openssl genrsa -out mydomain.key 2048
#
## Generating a Certificate Signing Request (CSR)
#sudo openssl req -new -key mydomain.key -out mydomain.csr
#
## Creating a Self-Signed Certificate (CRT)
#openssl x509 -req -days 365 -in mydomain.csr -signkey mydomain.key -out mydomain.crt
#
## Append KEY and CRT to mydomain.pem
#sudo bash -c 'cat mydomain.key mydomain.crt >> /etc/ssl/private/mydomain.pem'
#
## Specify PEM in haproxy config
#sudo vim /etc/haproxy/haproxy.cfg
#listen haproxy
#  bind 0.0.0.0:443 ssl crt /etc/ssl/private/mydomain.pem

# Validate convig
RUN haproxy -c -f /opt/haproxy-letsencrypt/haproxy.cfg

EXPOSE 1344
EXPOSE 80 443 8182

#CMD ["ls", "-la", "/opt/haproxy-letsencrypt"]
CMD ["haproxy", "-f", "/opt/haproxy-letsencrypt/haproxy.cfg"]
