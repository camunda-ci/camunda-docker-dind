#!/bin/sh

if [ $# -lt 2 ]; then
  echo "usage: $0 REPO_URL KEY_ID [DISTRO] [COMPONENT] [TYPE]"
  exit 1
fi

REPO_URL=$1
KEY_ID=$2
DISTRO=${3:-trusty}
COMPONENT=${4:-main}
TYPE=${5:-deb}
LIST_FILE=/etc/apt/sources.list.d/additional.list

echo "$TYPE $REPO_URL $DISTRO $COMPONENT" >> $LIST_FILE
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com $KEY_ID
