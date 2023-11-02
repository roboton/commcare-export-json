# NOTE
You are probably looking for the [commcare-export](https://github.com/dimagi/commcare-export) repository. This repository is not actively maintained or supported, but exists as an example of how to quickly and easily export all submitted forms from a CommCare domain as JSON objects that are dumped to a file and loaded on S3. The primary use case was to load all form submissions into a Snowflake table in a `VARIANT` column where we could access the semi-structured data, via the intermediary file stored on S3, which is easy for Snowflake to ingest.


# commcare-export-json
Docker set up to export json files to s3 from a CommCare project using the [commcare-export](https://github.com/dimagi/commcare-export) tool via an ephemeral PostgreSQL instance.

```
./run.sh <commcare hq> <commcare username> <commcare api key or password> <commcare auth-mode> <commcare project> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY> <s3 destination>
```
Links for more information on [commcare* flags](https://github.com/dimagi/commcare-export#command-line-usage),
 [AWS keys](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) and [s3 destination](https://docs.aws.amazon.com/cli/latest/reference/s3/#path-argument-type).

You can enable CommCare authentication using either a password or an API key by configuring the ```<commcare auth-mode>``` setting to 'password' or 'apikey'. More information on CommCare methods of authentication can be found [here](https://confluence.dimagi.com/display/commcarepublic/Authentication).