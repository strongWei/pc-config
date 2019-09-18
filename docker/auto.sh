#!/bin/bash
# 
# install docker
# @author strong
# @email 1025155365@qq.com
# 
# Environment: 
# Ubuntu 18.02 LTE

# uninstall
sudo apt-get remove docker docker-engine docker.io

# dependency
sudo apt-get install curl

# auto install
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun

# add docker group
sudo groupadd docker
sudo usermod -aG docker $USER
sudo cp daemon.json /etc/docker/


# start docker
sudo systemctl restart docker

# docker-compose install
proxySock='socket5://127.0.0.1:1080'
curl -L --preproxy ${proxySock} https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` --out-file docker-compose
sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose

# docker-compose bash completion
curl -L --preproxy ${proxySock}  https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose --output docker-compose
sudo mv docker-compose /etc/bash_completion.d/

echo "Now relogin you user"
exit 0

