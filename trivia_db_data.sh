#!/bin/bash

echo "Starting back-up of DLT EP Trivia Database (MySQL)!"

echo "Setting environment variables"
source ./trivia_db_backup.env

# Login to OCP
./trivia_db_ocp_login.sh

# Don't go to next script until a simulated <enter> was performed
yes "^M" | echo "About to execute DB backup"

# Get the Pod name where the Trivia DB is running
./trivia_db_backup.sh

