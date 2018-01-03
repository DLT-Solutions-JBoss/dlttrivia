#!/bin/bash

# Forward the port to your local machine of the Trivia DB
port=13306
if [[ $(netstat -ltn | grep ":${port} " | wc -l) -eq "0" ]] ; 
then 
  oc port-forward $TRIVIA_DB_POD $port:3306 &
fi
