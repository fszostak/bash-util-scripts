#!/usr/bin/env bash

# tunnel.sh
# Fabio Szostak
# Sun 28 Feb 2021 12:55:20 PM -03

if [ $# -eq 0 ]; then
	cat <<EOF

usage $(basename $0) [<gateway-host> <remote-host> <remote-port>] <local-port>

example:

Tunnel up
$(basename $0) my-gateway mydb.remote.host 3306 33306

Tunnel down
$(basename $0) 33306

EOF
	exit
fi

if [ $# -eq 1 ]; then
	L_PORT=$1
fi

GATEWAY_HOST=

if [ $# -eq 4 ]; then
	GATEWAY_HOST=$1
	R_HOST=$(getent hosts $2 | head -1 | awk '{ print $1 }' )
	R_PORT=$3
	L_PORT=$4
fi

KILL=$(lsof -i :$L_PORT | grep LISTEN | head -1 | awk '{ print $2 }')

if [ "$KILL" != "" ]; then
	kill $KILL
	[ $? -ne 0 ] && echo "SSH Tunnel is down (PID=$KILL)" && exit 
fi

if [ "$GATEWAY_HOST" != "" ]; then
	ssh -f -L $L_PORT:$R_HOST:$R_PORT -N $GATEWAY_HOST 
	[ $? -eq 0 ] && echo "SSH Tunnel is stated on locahost:$L_PORT"
fi
