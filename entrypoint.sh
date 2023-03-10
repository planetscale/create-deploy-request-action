#!/bin/sh -l

command="pscale deploy-request create $1 $2 --org $3 \
  --service-token $PLANETSCALE_TOKEN --service-token-id $PLANETSCALE_TOKEN_NAME"

if [ -n "$4" ];then
  command="$command --deploy-to $4"
fi


CMDOUT=$(eval $command)

number=$(jq -n "$CMDOUT" | jq '.number')
echo "number=$number" >> $GITHUB_OUTPUT