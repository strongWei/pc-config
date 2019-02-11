#!/bin/bash
sudo apt-get purge --auto-remove docker docker-engine docker.io docker-ce

sudo rm -rf /usr/local/bin/docker-compose
