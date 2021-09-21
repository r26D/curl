#!/bin/bash -l
set -e


set -e
URL=${1}
if [[ -z "${2}" ]]; then
  STATUS_CODE="200"
else
  STATUS_CODE=${2}
fi
if [[ -z "${3}" ]]; then
  CHECK_INTERVAL_SECONDS=10
else
  CHECK_INTERVAL_SECONDS=${3}
fi
if [[ -z "${4}" ]]; then
  MAX_NUMBER_OF_CHECKS=60
else
  MAX_NUMBER_OF_CHECKS=${4}
fi


CURRENT_STATUS_CODE=0
NUMBER_OF_CHECKS=0

while [ "$CURRENT_STATUS_CODE" != "$STATUS_CODE" ] && [  $MAX_NUMBER_OF_CHECKS -gt $NUMBER_OF_CHECKS ]; do
	echo "Checking - status is ${CURRENT_STATUS_CODE}"
	CURRENT_STATUS_CODE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' ${URL})
	sleep ${CHECK_INTERVAL_SECONDS}
	NUMBER_OF_CHECKS=$(expr $NUMBER_OF_CHECKS + 1)
	echo "Check # ${NUMBER_OF_CHECKS}/${MAX_NUMBER_OF_CHECKS}"
done
echo "FINAL STATUS = ${CURRENT_STATUS_CODE} vs ${STATUS_CODE}"	

if [ $NUMBER_OF_CHECKS -lt $MAX_NUMBER_OF_CHECKS ] ; then
   exit 0
else 
   echo "TIMEOUT WAITING FOR STATUS"	
   exit 1
fi
