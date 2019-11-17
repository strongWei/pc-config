#!/bin/bash
# auto change the system after install linux mint
# 
# Author: strong
# Email: 1125155365@qq.com

# import other module
. ../../module/common.sh

baseDir=`getCurDir`
libDir=$baseDir"/libs"

#decrypt:need password 
encryptDir=$libDir"/encrypt"
encryptSource=$libDir"/encrypt.7z" 
7za x -aoa -o$encryptDir $encryptSource 
[ $? != 0 ] && echo "decrypt "$encryptSource" error" && exit 1

#back up
backDir=$libDir"/backup"
echo $backDir
[ -d "$backDir" ] || mkdir $backDir
date=`date +%Y%m%d-%H%M%S`
aptBk=$backDir"/"$date"apt.7z"
7za a $aptBk /etc/apt 
[ $? != 0 ] &&  echo "encrypt "$aptBk" error" && exit 1 
sshBk=$backDir"/"$date"ssh.7z"
7za a $sshBk $HOME/.ssh 
[ $? != 0 ] && echo "encrypt "$sshBk" error" && exit 1 

#override the config
sudo cp -a $encryptDir"/apt" /etc/apt 
[ $? != 0 ] &&  echo "override /etc/apt failed" && exit 1 
cp -a $encryptDir"/.ssh" $HOME/.ssh 
[ $? != 0 ] &&  echo "override "$HOME"/.ssh failed" && exit 1 

sudo apt update 
sudo apt upgrade -y
#install chrome
sudo apt install google-chrome-stable virtualbox -y

#promt
echo "Now you need to do:\n"
echo "1. set the fctix input method\n"
echo "2. open the redshift and let it autostart\n"
echo "3. install chrome plugin named proxy Omega which location is "$libDir"/proxy_omega.7z\n"



