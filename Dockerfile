FROM 086911230249.dkr.ecr.us-east-1.amazonaws.com/alpine-base:3.3
MAINTAINER DevOps "richard.boydii@gmail.com"

LABEL version=0.0

WORKDIR /usr/local/bin

RUN apk add --update nodejs && rm -rf /var/cache/apk/*

ONBUILD ADD . /src