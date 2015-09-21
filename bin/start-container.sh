#!/bin/bash

DOCKER_SOCK=/var/run/docker.sock
if [ ! -S $DOCKER_SOCK ]; then
  echo "File $DOCKER_SOCK does not exist. Aborting."
  exit 1;
fi

DOCKER_GRP=`ls -l $DOCKER_SOCK | awk '{print $4}'`

case $DOCKER_GRP in
  'docker')
    echo 'Docker group found.'
    ;;

  ''|*[!0-9]*)
    echo 'Docker group is empty or not a number or not found'
    ;;

  *)
     echo "Dynamically creating docker group for id $DOCKER_GRP"
     groupadd -g $DOCKER_GRP docker
     usermod -aG docker camunda
     ;;

esac

# start docker daemon
exec /usr/bin/supervisord
