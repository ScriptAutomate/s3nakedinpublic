#!/usr/bin/env bash

# Requires awcli
# pip install awscli --user --upgrade
# https://docs.aws.amazon.com/cli/latest/userguide/installing.html
BUCKETS=`aws s3api list-buckets --query 'Buckets[*].Name' --output text | tr " " "\n"`
for BUCKET in $BUCKETS
do
  OH_NOES=`aws s3api get-bucket-acl --bucket $BUCKET | grep -e 'URI.*http\:\/\/acs\.amazonaws\.com\/groups\/global\/AllUsers\"'`
  if [ ! -z "$OH_NOES" ]
  then
    echo "$BUCKET"
  fi
done
