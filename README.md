## Build

```sh
docker build -t dynamodb-cross-region-replication .
```

## Before start

1. Configure _.aws/config_ and _./aws/credentials_. More format information, see http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html.

2. Configure __SRC_REGION__, __DEST_REGION__, __SRC_TABLE__, and __DEST_TABLE__ in _docker-compose.yml_. 

## Start

```sh
docker-compose up -d
```
