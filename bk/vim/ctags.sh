#!/bin/bash
#
# for ctags installation
#
# @author strong
# @email  1025155365@qq.com
# @file   ctags.sh

#export PATH=

curDir=`getCurDir`

sudo apt install -y  build-essential git autoconf automake pkg-config

lib=${curDir}/libs
ctagIDir=/usr/local/universal-ctags

[ -d "${ctagIDir}" ] && rm -rf ${ctagIDir}
[ -d "${lib}" ] || mkdir -p ${lib}

#install
git clone https://github.com/universal-ctags/ctags ${lib}/ctags

cd ${lib}/ctags
./autogen.sh && ./configure --prefix=${ctagIDir} && make -j8 && sudo make install

#add link
link=/usr/local/bin/ctags
[ -L "${link}" ] && sudo rm -rf ${link}
sudo ln -s ${ctagIDir}/bin/ctags ${link}

#config link
ctagConf=~/.ctags.d
conf=${curDir}/conf
[ -d "${ctagConf}" -o -L "${ctagConf}" ] && rm -rf ${ctagConf}
ln -s ${conf}/.ctags.d  ${ctagConf}
