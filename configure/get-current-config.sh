#!/bin/bash

set -e

if [[ -z $1 ]]; then
	OUTPUT_PATH="/tmp/current-config.toml"
	echo "no output path for current interlock config provided. Defaulting to $OUTPUT_PATH"
fi

OUTPUT_PATH="/tmp/current-config.toml"
echo "Getting current config name..."
CURRENT_CONFIG_NAME=$(docker service inspect --format '{{ (index .Spec.TaskTemplate.ContainerSpec.Configs 0).ConfigName }}' ucp-interlock)
echo "Current config name: $CURRENT_CONFIG_NAME"

echo "File output at $OUTPUT_PATH"
docker config inspect --format '{{ printf "%s" .Spec.Data }}' $CURRENT_CONFIG_NAME > $OUTPUT_PATH

echo "You may now make changes /tmp/current-config.toml."
