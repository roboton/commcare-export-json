# commcare-export-json
Docker set up to export json files from a Commcare project via an ephemeral PostgreSQL instance.

```
./run.sh <commcare hq> <commcare username> <commcare api key> <commcare project> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY> <s3 destination>
```
Links for more information on [commcare* flags](https://github.com/dimagi/commcare-export#command-line-usage),
 [AWS keys](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) and [s3 destination](https://docs.aws.amazon.com/cli/latest/reference/s3/#path-argument-type).
