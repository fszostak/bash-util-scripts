#!/bin/bash
# ---------------------------------------------
# ecs-get-ip.sh
#
# Get public IP from first task of ECS FARGATE
#
# Author: Fabio Szostak <fszostak@gmail.com> 
# Mon Sep 24 16:44:55 -03 2018
# ---------------------------------------------

if [ $# -eq 0 ]; then
	echo "use: $0 <ecs-cluster-name> [<ecs-service-name>]"
	exit
fi

CLUSTER=$1

if [ $# -eq 2 ]; then
	SERVICE=$2
else
	SERVICE=${CLUSTER}-service
fi

echo
echo "Cluster: $CLUSTER"
echo "Service: $SERVICE"
echo

echo "Getting network..."
ENI=`aws ecs describe-tasks --cluster "$CLUSTER" --tasks $(aws ecs list-tasks --cluster "$CLUSTER" --service "$SERVICE" --output text --query taskArns[0])  --query  "tasks[0].attachments[0].details[?name=='networkInterfaceId'].value" | grep '"' | sed -E "s/.*\"(.*)\".*/\1/g"`

echo "eni: $ENI" 
echo

echo "Getting public IP..."
aws ec2 describe-network-interfaces --query "NetworkInterfaces[?NetworkInterfaceId=='$ENI'].PrivateIpAddresses[0].Association.PublicIp" | grep '"' | sed -E "s/.*\"(.*)\".*/\1/g"
echo
