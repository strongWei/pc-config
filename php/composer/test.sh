#!/bin/bash
str1="abcdefgh"
str2="def"
if [[ $str1 =~ $str2 ]]
then
    echo "包含"
else
    echo "不包含"
fi
