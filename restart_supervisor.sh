#!/bin/bash
# As root
#
# Created by Chuck on Thu Dec 22 09:03:16 GMT 2016
# Run supervisor script and email supervisord status

echo "$(date) Change Directory to supervisor.d"
cd /etc/supervisord.d/
echo "Stop supervisor.d Service"
service supervisord stop
echo "Start supervisor using the appropriate supervisord conf file"
supervisord -c supervisord.conf
echo "sleep for 5 seconds before checking supervisorctl status"
sleep 5;
# Send email notification to external accout
supervisorctl status | mailx -s "Cloud Supervisord workers status" userx.@gmail.com
echo "Check that workers are running from the email notification!"
supervisorctl status
