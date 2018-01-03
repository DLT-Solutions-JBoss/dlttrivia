#!/bin/bash

dt=$(date '+%m/%d/%Y %H:%M:%S');

echo "Starting back-up of DLT EP Trivia Database (MySQL)!"

echo "Setting environment variables"
source ./trivia_db_backup.env

# Login to OCP
oc login $OCP_URL -u $OCP_LOGIN -p $OCP_PWD

# Ensure you are on the correct project where the Trivia DB is running
oc project $OCP_TRIVIA_PROJECT

# Get the Pod name where the Trivia DB is running
export TRIVIA_DB_POD=`oc get pods -o jsonpath='{.items[*].metadata.name}' --selector deploymentConfig=trivia-mysql`

# Forward the port to your local machine of the Trivia DB
if [[ $(netstat -ltn | grep ":${TRIVIA_DB_LOCAL_PORT} " | wc -l) -eq "0" ]] ;
then
  yes "\r" | oc port-forward $TRIVIA_DB_POD $TRIVIA_DB_LOCAL_PORT:3306 & > /dev/null
  yes "\r" | echo "Trivia DB port now forwarded from $TRIVIA_DB_LOCAL_PORT to 3306"
fi


