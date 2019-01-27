#!/bin/bash
#

#auto git submodule
git submodule update --init --recursive

cDir=`pwd`

# install submodule vim
vimDir=${cDir}/vim
ln -s ${vimDir}/.vimrc $HOME/.vimrc
ln -s ${vimDir}/.vim   $HOME/.vim




