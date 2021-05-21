#!/bin/bash
if [ "$#" -ne 6 ]; then
    echo "./run.sh <commcare username> <commcare api key> <commcare project> <s3 destination> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY>"
    exit 1
fi
CC_USER=$1 CC_APIKEY=$2 CC_PROJECT=$3 AWS_ACCESS_KEY_ID=$4 AWS_SECRET_ACCESS_KEY=$5 S3_DEST=$6 docker-compose up --build --abort-on-container-exit
