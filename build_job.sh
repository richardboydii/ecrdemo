#!/bin/bash

#Repo information
REG_ADDRESS="086911230249.dkr.ecr.us-east-1.amazonaws.com/"
PROJECT="ecrdemo"


BDATE="date +%Y-%m-%d:%H:%M:%S"
IFS='=' read -ra OLDVER <<< "$(grep -F version /tmp/jenkins/ecrdemo/Dockerfile | awk '{print $2}')"
VERSION=$(echo "${OLDVER[1]}" + "1.0" | bc)

#Login to ECR Repository
LOGIN_STRING=`aws ecr get-login`
${LOGIN_STRING}

#Add the new Version and Build Date to the Dockerfile
sed -i '4s/.*/LABEL version=$VERSION date=$BDATE /' Dockerfile

#Build the container
cd /tmp/jenkins/ecrdemo
docker build -t ${PROJECT}:${VERSION} .
docker tag ${PROJECT}:${VERSION} ${REG_ADDRESS}/${PROJECT}:${VERSION}

#Push the container
docker push ${REG_ADDRESS}/${PROJECT}:${VERSION}