#!/bin/bash
#

#auto git submodule
git submodule update --init --recursive

cDir=`pwd`

bin/bash ${cDir}/vim/install.sh
