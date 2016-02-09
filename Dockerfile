FROM 086911230249.dkr.ecr.us-east-1.amazonaws.com/alpine-base:3.3
MAINTAINER DevOps "richard.boydii@gmail.com"

LABEL version=1.0

#RUN apk add --update nginx && rm -rf /var/cache/apk/*

WORKDIR /usr/local/bin

ONBUILD ADD . /src