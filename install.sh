#!/bin/bash
# initial environment automaticly

#auto git submodule
echo 'auto init submodule'
git submodule update --init --recursive

cDir=`pwd`

# install submodule vim
echo 'installing submodule vim'
vimDir=${cDir}/vim
ln -s ${vimDir}/.vimrc $HOME/.vimrc
ln -s ${vimDir}/.vim   $HOME/.vim

# install submodule zsh
echo 'installing submodule zsh'
sudo apt install zsh

curl -L git.io/antigen > $HOME/antigen.zsh

zshDir=${cDir}/zsh
ln -s ${zshDir}/.zshrc $HOME/.zshrc

# nvm: the package manager for nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# node
nvm install stable
npm config set registry=https://registry.npm.taobao.org

# yarn: 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get install --no-install-recommends yarn


# install es-lint
npm install -g es-lint
## react
npm install -g eslint-plugin-react

# install style-lint
npm install -g stylelint
npm install -g stylelint-config-standard
