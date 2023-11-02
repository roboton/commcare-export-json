#!/bin/bash

if [ "$#" -ne 8 ]; then
    echo "run.sh <commcare hq> <commcare username> <commcare api key> <commcare project> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY> <s3 destination>"
    exit 1
fi

CC_HQ=$1 CC_USER=$2 CC_APIKEY=$3 CC_AUTH_MODE=$4 CC_PROJECT=$5 AWS_ACCESS_KEY_ID=$6 AWS_SECRET_ACCESS_KEY=$7 S3_DEST=$8 docker-compose up --build --abort-on-container-exit
docker compose down --volumes