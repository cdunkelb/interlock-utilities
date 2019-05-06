# interlock-utilities

Interlock-utilities is a collection of scripts intending to make interlock easier to use, test, and troubleshoot. These scripts are rough. Use at your own risk.

 - Configure
   - get-current-config.sh - Inspects the ucp-interlock service and downloads the currently used configuration.
   - create-config.sh - Takes a config file on the local machine and creates a `docker config` entry in the swarm
   - update-config.sh - After creating the the config in swarm, it updates the ucp-interlock config to the entry created by `create-config.sh`
 - Test - only use if you want to break your cluster
   - make-services.sh - makes n number of stacks with a basic container and overlay network to stress test interlock
   - restarting-service.sh - creates a service that gets stuck in a reboot loop
 - Troubleshoot - scripts to examine the cluster with read-only operations for troubleshooting
   - find-restarting-services.sh - Finds services with tasks that have been recent started.
