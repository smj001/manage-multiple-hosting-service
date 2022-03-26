#!/bin/bash
./give-user-data.sh $1 > /tmp/data-list
input="/tmp/data-list"
while IFS= read -r LINE
do
	SUSPEND_STATUS=$(echo $LINE | gawk -F ',' '{print $3}' | sed 's/ //g')
	USER=$(echo $LINE | gawk -F ',' '{print $2}' | sed 's/^ //g')
	SERVER_NAME=$(echo $LINE | gawk -F ',' '{print $1}' | sed 's/^ //g')
	if [[ -n $LINE ]]
	then
		ssh $SERVER_NAME "whmapi1 removeacct user=$USER" 1>> log/host-terminate.log 2>> log/host-terminate-err.log
		echo "Account $USER and mail $1 in $SERVER_NAME terminate successfully."
	else
		echo "No account found for $USER and mail $1"
	fi
done < "$input"
