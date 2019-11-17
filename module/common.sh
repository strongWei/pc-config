#!/bin/bash
#
#
# @author strong
# @email  1025155365@qq.com
# @file   common.sh

function getCurDir(){
    baseDir=$(cd "$(dirname "$0")";pwd)
    echo ${baseDir}
}
