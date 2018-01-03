#!/bin/bash

dt=$(date '+%m/%d/%Y %H:%M:%S');

echo "Starting back-up of DLT EP Trivia Database (MySQL)!"

# Login to OCP
oc login $OCP_URL -u $OCP_LOGIN -p $OCP_PWD

# Ensure you are on the correct project where the Trivia DB is running
oc project $OCP_TRIVIA_PROJECT

# Get the Pod name where the Trivia DB is running
export TRIVIA_DB_POD=`oc get pods -o jsonpath='{.items[*].metadata.name}' --selector deploymentConfig=trivia-mysql`


