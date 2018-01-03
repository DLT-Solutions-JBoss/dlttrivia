#!/bin/bash

dt=$(date '+%m/%d/%Y %H:%M:%S');

# Run mysqldump to obtain latest trivia data
echo mysqldump trivia user question choice question_choice tag question_tag contest contestant scheduled_question ask response hibernate_sequence --user=$TRIVIA_DB_USER --password=$TRIVIA_DB_PWD --host=127.0.0.1 --port=$port --no-create-info --skip-triggers --compact 
mysqldump trivia user question choice question_choice tag question_tag contest contestant scheduled_question ask response hibernate_sequence --user=$TRIVIA_DB_USER --password=$TRIVIA_DB_PWD --host=127.0.0.1 --port=$port --no-create-info --skip-triggers --compact > ./src/main/resources/init_data_2.sql

echo "Retrieved back-up of DLT EP Trivia Database (MySQL)..."
ls -lrt ./src/main/resources/init_data_2.sql

# Logout of OCP
oc logout

echo "Updating DLTTrivia Git repo..."

# Commit latest file
git commit -am "latest backup of DLT Trivia DB at $dt"

# Push to origin
git push 

