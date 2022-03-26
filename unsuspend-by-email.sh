#!/bin/bash
./give-user-data.sh $1 > /tmp/data-list
input="/tmp/data-list"
while IFS= read -r LINE
do
	SUSPEND_STATUS=$(echo $LINE | gawk -F ',' '{print $3}' | sed 's/ //g')
	USER=$(echo $LINE | gawk -F ',' '{print $2}' | sed 's/^ //g')
	SERVER_NAME=$(echo $LINE | gawk -F ',' '{print $1}' | sed 's/^ //g')
	if [[ $SUSPEND_STATUS == '0' ]]
	then
		echo user $USER by mail $1 not suspended.
	else
		ssh $SERVER_NAME "whmapi1 unsuspendacct user=$USER" 1>> log/host-unsuspend.log 2>> log/host-suspend-err.log
		echo user $USER by mail $1 in host $SERVER_NAME unsuspend successfully.
	fi
done < "$input"
