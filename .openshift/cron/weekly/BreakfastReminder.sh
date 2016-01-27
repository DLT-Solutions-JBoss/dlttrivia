#!/bin/bash                                                                                                                                                                                     
CURL='/usr/bin/curl'
RVMHTTP="http://dltepbreakfast-dltjbossmw.rhcloud.com/rest/EP/email"
CURLARGS="-f -s -S -k"

# or you can redirect it into a file:
$CURL $CURLARGS $RVMHTTP > /tmp/breakfast-reminder.log
