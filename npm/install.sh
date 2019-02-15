#!/bin/bash
# initial environment automaticly

# nvm: the package manager for nodejs
echo 'you must install zsh before do this!'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# node
nvm install stable
npm config set registry=https://registry.npm.taobao.org

