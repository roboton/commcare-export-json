#!/bin/sh
commcare-export --project ${CC_PROJECT} --username ${CC_USER} --password ${CC_APIKEY} \
    --auth-mode apikey --output-format sql --output postgresql://postgres:postgres@postgres/postgres \
    --query json_export.xlsx && \
    psql postgresql://postgres:postgres@postgres/postgres -f export_to_disk.sql && \
    aws s3 cp /tmp/json_export.json ${S3_DEST}
