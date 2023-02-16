FROM haproxy:latest

MAINTAINER MLC team

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
##

# Validate convig
RUN haproxy -c -f $APPLICATION_NAME/haproxy.cfg

EXPOSE 1344
EXPOSE 80 443

CMD ["haproxy", "-f", "/opt/haproxy-letsencrypt/haproxy.cfg"]