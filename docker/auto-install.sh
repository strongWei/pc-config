#!/bin/bash
# Environment: 
# Ubuntu 18.02 LTE

sudo sh get-docker.sh --mirror Aliyun

sudo usermod -aG docker $USER
sudo cp daemon.json /etc/docker/

curl -L https://github.com/docker/compose/releases/download/1.18.0/run.sh > /tmp/docker-compose

sudo mv /tmp/docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose
