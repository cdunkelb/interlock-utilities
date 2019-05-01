#!/bin/bash

set -e

NEW_FILENAME=$1
if [[ -z $NEW_FILENAME ]]; then
	echo "Usage: $0 FILE_NAME"
	exit
fi

CURRENT_CONFIG_NAME=$(docker service inspect --format '{{ (index .Spec.TaskTemplate.ContainerSpec.Configs 0).ConfigName }}' ucp-interlock)
echo "Current config assigned to ucp-interlock in the cluster: $CURRENT_CONFIG_NAME"

NEW_CONFIG_NAME="com.docker.ucp.interlock.conf-$(( $(cut -d '-' -f 2 <<< "$CURRENT_CONFIG_NAME") + 1 ))"
echo "New config in cluster will be named $NEW_CONFIG_NAME"


echo "Updating file from $NEW_FILENAME"


docker config create $NEW_CONFIG_NAME $NEW_FILENAME

echo "Success!"
