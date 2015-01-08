#!/bin/sh

if [ $# -lt 1 ]; then
  echo "usage: $0 PACKAGE_NAME [PACKAGE_NAME...]"
  exit 1
fi

# update package lists
apt-get update

# install packages
apt-get -y install --no-install-recommends $@

# clean caches
clean-caches.sh
