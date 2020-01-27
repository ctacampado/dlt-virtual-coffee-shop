#!/bin/bash
docker-compose -f docker-compose.yaml down

# STOP AND DELETE THE DOCKER CONTAINERS
docker ps -aq | xargs -n 1 docker stop
docker ps -aq | xargs -n 1 docker rm -v

# DELETE THE OLD DOCKER VOLUMES
docker volume prune

# DELETE OLD DOCKER NETWORKS (OPTIONAL: seems to restart fine without)
docker network prune

# DELETE SCRIPT-CREATED FILES
#sudo rm -rf channel-artifacts/ crypto-config/

# VERIFY RESULTS
docker ps -a
docker volume ls
ls -l
