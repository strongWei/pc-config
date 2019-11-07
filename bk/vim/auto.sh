#/bin/bash
#
# used for vim aitomation
#
# @author strong
# @email  1025155365@qq.com
# @file   auto.sh

#import 
. ./module/common.sh
. ./ctags.sh

# export PATH=
baseDir=$(cd "$(dirname "$0")";pwd)
echo ${baseDir}

# install dependencies
#sudo apt install vim build-essential git
#
#vundlePath=${baseDir}".vim/bundle/Vundle.vim"
#[ -d "${vundlePath}" ] && rm -rf ${vundlePath}
#
## get vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ${vundlePath}
#
## add link
#vimrcDir=$HOME'/.vimrc'
#vimLibDir=$HOME'/.vim'
#[ -f "${vimrcDir}" -o  -L "${vimrcDir}" ] && rm -rf ${vimrcDir}
#[ -d "${vimLibDir}" -o  -L "${vimLibDir}" ] && rm -rf ${vimLibDir}
#ln -s ${baseDir}/conf/.vimrc  ${vimrcDir}
#ln -s ${baseDir}/.vim  ${vimLibDir}
