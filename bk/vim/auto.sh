#!/bin/bash
#
# used for vim aitomation
#
# @author strong
# @email  1025155365@qq.com
# @file   auto.sh

#export PATH=
curDir=`dirname $0`

# install dependencies
sudo apt install vim build-essential git

vundlePath=${curDir}".vim/bundle/Vundle.vim"

# get vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${vundlePath}

# add link
vimrcDir='~/.vimrc'
vimLibDir='~/.vim'
[ -f "${vimrcDir}" ] && rm -rf ${vimrcDir}
[ -d "${vimLibDir}" ] && rm -rf ${vimLibDir}
ln -s ${curDir}/conf/.vimrc  ~/.vimrc
ln -s ${curDir}/.vim  ${vimLibDir}
