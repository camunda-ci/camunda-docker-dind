#!/bin/sh

# clean apt-cache
apt-get clean

# clean caches
rm -rf /var/cache/*
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/* /var/tmp/*
