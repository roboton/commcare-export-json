# syntax=docker/dockerfile:1
FROM python:3.8-slim
WORKDIR /tmp
RUN pip install psycopg2-binary commcare-export
RUN apt-get update && apt-get install -y postgresql-client curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \ 
    unzip awscliv2.zip && ./aws/install 
COPY json_export.xlsx json_export.xlsx
COPY export_to_disk.sql export_to_disk.sql
COPY wait-for-postgres.sh wait-for-postgres.sh
COPY det-pg-json-export.sh det-pg-json-export.sh
CMD ["sh", "wait-for-postgres.sh", "postgres", "./det-pg-json-export.sh"]
