#!/bin/bash

# Forward the port to your local machine of the Trivia DB
if [[ $(netstat -ltn | grep ":${TRIVIA_DB_LOCAL_PORT} " | wc -l) -eq "0" ]] ; 
then 
  oc port-forward $TRIVIA_DB_POD $TRIVIA_DB_LOCAL_PORT:3306 &
fi
