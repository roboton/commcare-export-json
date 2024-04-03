#!/bin/sh

# Initial variables
RETRIES=10
WAIT_TIME=10

# CommCare export command
commcare-export --commcare-hq ${CC_HQ} --project ${CC_PROJECT} \
    --username ${CC_USER} --password ${CC_APIKEY} --auth-mode ${CC_AUTH_MODE} \
    --output-format sql --output postgresql://postgres:postgres@postgres/postgres \
    --query json_export.xlsx

# Wait for PostgreSQL to be ready
until psql postgresql://postgres:postgres@postgres/postgres -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for postgres to be ready..."
  sleep $WAIT_TIME
  RETRIES=$((RETRIES-1))
done

if [ $RETRIES -eq 0 ]; then
  echo "Postgres is not ready after maximum retries, exiting."
  exit 1
fi

# If here, Postgres is ready
echo "Postgres is ready."

# Run SQL script and copy to AWS S3
psql postgresql://postgres:postgres@postgres/postgres -f export_to_disk.sql && \
aws s3 cp /tmp/json_export.csv ${S3_DEST}/${CC_PROJECT}_$(date +%Y%m%dT%H%M%S).csv