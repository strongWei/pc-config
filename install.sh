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
sudo apt install curl zsh

curl -L git.io/antigen > $HOME/antigen.zsh

zshDir=${cDir}/zsh
ln -s ${zshDir}/.zshrc $HOME/.zshrc

