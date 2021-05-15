#!/bin/bash
if [ "$#" -ne 4 ]; then
    echo "./run.sh <commcare username> <commcare api key> <commcare project> <s3 destination>"
    exit 1
fi
CC_USER=$1 CC_APIKEY=$2 CC_PROJECT=$3 S3_DEST=$4 docker-compose up --build --abort-on-container-exit
