#!/bin/bash
#

#auto git submodule
git submodule update --init --recursive

cDir=`pwd`

# install submodule vim
vimDir=${cDir}/vim
ln -s ${vimDir}/.vimrc $HOME/.vimrc
ln -s ${vimDir}/.vim   $HOME/.vim

# nvm: the package manager for nodejs
sudo apt install nvm
# node
nvm install stable


# install es-lint
npm install -g es-lint
## react
npm install -g eslint-plugin-react

# install style-lint
npm install -g stylelint
npm install -g stylelint-config-standard
