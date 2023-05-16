#!/bin/sh -l

command="pscale deploy-request create $1 $2 --org $3 -f json"

if [ -n "$4" ];then
  command="$command --deploy-to $4"
fi

CMDOUT=$(eval $command)

ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi

number=$(jq -n "$CMDOUT" | jq '.number')
echo "number=$number" >> $GITHUB_OUTPUT
