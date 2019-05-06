#!/bin/bash


echo "Searching for services that contain 'seconds ago' in their 'docker service ps' status"
echo "Run this on a manager node or through an admin client bundle"

for i in $(docker service ls --format '{{.Name}}'); do

	SERVICE_PS=$(docker service ps --format '{{.CurrentState}}' $i | grep "seconds ago")
	if [[ -n $SERVICE_PS ]]; then
		echo ===$i===
		echo $SERVICE_PS
		echo
	fi

done

echo "Done"
