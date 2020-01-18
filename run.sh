#!/bin/bash
# set -x
LOC=https://245eb1314b86435f9ae6a56e9b5f02fd.us-central1.gcp.cloud.es.io:9243
TYPE=$1
QUERY=$2
# if [ $# -ge 3 ]; then
   # DATA="-d$DATA"
# else
   # DATA=''
# fi

DATA=''
if [[ "$TYPE" == "PUT" ]] || [[ "$TYPE" == "POST" ]];
then
   DATA=$(cat)
   DATA=-d"${DATA}"
   curl -s -u elastic:tH41yQpXaekgsixOXRricHJW -H "Content-Type: application/json" \
      -X${TYPE} \
      "https://245eb1314b86435f9ae6a56e9b5f02fd.us-central1.gcp.cloud.es.io:9243${QUERY}" "$DATA"
else
   curl -s -u elastic:tH41yQpXaekgsixOXRricHJW -H "Content-Type: application/json" \
      -X${TYPE} \
      "https://245eb1314b86435f9ae6a56e9b5f02fd.us-central1.gcp.cloud.es.io:9243${QUERY}"
fi
# $CURL -X${TYPE} "${LOC}${QUERY}" $DATA


