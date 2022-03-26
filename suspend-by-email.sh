#!/bin/bash
./give-user-data.sh $1 > /tmp/data-list
input="/tmp/data-list"
while IFS= read -r LINE
do
	SUSPEND_STATUS=$(echo $LINE | gawk -F ',' '{print $3}' | sed 's/ //g')
	USER=$(echo $LINE | gawk -F ',' '{print $2}' | sed 's/^ //g')
	SERVER_NAME=$(echo $LINE | gawk -F ',' '{print $1}' | sed 's/^ //g')
	if [[ $SUSPEND_STATUS == '1' ]]
	then
		echo user $USER by mail $1 suspended.
	else
		ssh $SERVER_NAME "whmapi1 suspendacct user=$USER reason=MarketingReport leave-ftp-accts-enabled=0" 1>> log/host-suspend.log 2>> log/host-suspend-err.log
		echo user $USER by mail $1 in host $SERVER_NAME suspend successfully.
	fi
done < "$input"
