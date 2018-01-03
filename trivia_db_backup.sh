#!/bin/bash

dt=$(date '+%m/%d/%Y %H:%M:%S');

echo "Starting back-up of DLT EP Trivia Database (MySQL)!"

# Login to OCP
oc login $OCP_URL -u $OCP_LOGIN -p $OCP_PWD

# Ensure you are on the correct project where the Trivia DB is running
oc project $OCP_TRIVIA_PROJECT

# Get the Pod name where the Trivia DB is running
export TRIVIA_DB_POD=`oc get pods -o jsonpath='{.items[*].metadata.name}' --selector deploymentConfig=trivia-mysql`

# Forward the port to your local machine of the Trivia DB
oc port-forward $TRIVIA_DB_POD 13306:3306 &

# Run mysqldump to obtain latest trivia data
mysqldump trivia user question choice question_choice tag question_tag contest contestant scheduled_question ask response hibernate_sequence --user=$TRIVIA_DB_USER --password=$TRIVIA_DB_PWD --host=127.0.0.1 --port=13306 --no-create-info --skip-triggers --compact > ./src/main/resources/init_data_2.sql

echo "Retrieved back-up of DLT EP Trivia Database (MySQL)..."
ls -lrt ./src/main/resources/init_data_2.sql

echo "Updating DLTTrivia Git repo..."

# Commit latest file
git commit -am "latest backup of DLT Trivia DB at $dt"

# Push to origin
git push 

