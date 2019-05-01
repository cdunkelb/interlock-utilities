#!/bin/bash

set -e


CURRENT_CONFIG_NAME=$(docker service inspect --format '{{ (index .Spec.TaskTemplate.ContainerSpec.Configs 0).ConfigName }}' ucp-interlock)
NEW_CONFIG_NAME="com.docker.ucp.interlock.conf-$(( $(cut -d '-' -f 2 <<< "$CURRENT_CONFIG_NAME") + 1 ))"

echo "Updating Interlock config to $NEW_CONFIG_NAME"

read -p "Continue? [y/n]" UPDATE_CONFIG
if [[ $UPDATE_CONFIG != "y" ]]; then
	echo "Option entered is != y. Exiting..."
	exit
fi

docker service update \
  --config-rm $CURRENT_CONFIG_NAME \
  --config-add source=$NEW_CONFIG_NAME,target=/config.toml \
  ucp-interlock
