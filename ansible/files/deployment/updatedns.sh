#!/bin/bash

### Script to update Route53 DNS from an EC2 instance
### Requires values to be supplied as parameters to this script
###   $1 - the dns zone id - e.g. X09994542P31234QCXABC
###   $2 - the fqdn - e.g. chips-batch-server1.development.heritage.aws.internal
###   Also requires the instance IAM profile to allow updates to the specified zone in Route53

echo " ~~~~~~~~~ Starting DNS update script: `date -u "+%F %T"`"

ZONE_ID=$1
if [ -z "${ZONE_ID}" ]; then 
  echo "ZONE_ID is missing";
  exit 1
fi

FQDN=$2
if [ -z "${FQDN}" ]; then 
  echo "FQDN is missing";
  exit 1
fi

IP=$( ec2-metadata -o | awk '{print $2}' )
echo "{ \"Comment\": \"UPSERT host record for ${FQDN}\", \"Changes\": [{ \"Action\": \"UPSERT\", \"ResourceRecordSet\": { \"Name\": \"${FQDN}\", \"Type\": \"A\", \"TTL\": 60, \"ResourceRecords\": [{ \"Value\": \"${IP}\"}] }}] }" > dns.json
aws route53 change-resource-record-sets --hosted-zone-id ${ZONE_ID} --change-batch file://dns.json
