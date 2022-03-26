#!/bin/bash

for SERVER_NAME in $(cat destination.list)
do
	ssh $SERVER_NAME "whmapi1 listaccts | grep -w 'domain\|email\|user\|suspended' | grep -v suspendreason | sed 's/^      //g' | grep -A 2 -B 1 -w $1" > /tmp/user-data
	USER_NAME=$(cat /tmp/user-data | grep '^user' | gawk '{print $NF}')
	SUSPEND_STATUS=$(cat /tmp/user-data | grep '^suspended' | gawk '{print $NF}')
	EMAIL=$(cat /tmp/user-data | grep '^email' | gawk '{print $NF}')
	DOMAIN=$(cat /tmp/user-data | grep '^domain' | gawk '{print $NF}')
	if [[ -n $EMAIL ]]
	then
		echo $SERVER_NAME, $USER_NAME, $SUSPEND_STATUS, $EMAIL, $DOMAIN
	fi
done
