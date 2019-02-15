#!/bin/bash
# initial environment automaticly

# yarn: 
echo 'Note: you must install zsh before do this!'
echo 'Note: you must install nvm before do this!'
echo 'installing yarn' 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get install --no-install-recommends yarn
