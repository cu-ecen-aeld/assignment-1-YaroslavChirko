#!/bin/sh

if [ $# -lt 2 ]
then
	echo "Expected 2 arguments but $# was provided instead."
	exit 1  
fi

writefile=$1
writestr=$2

# We need to get a path without the filename part for mkdir
# Regular expression is used to remove the substring
filePath=${writefile%/*\.*}

# Creating all of the directories needed, -p option as we'll probably
# need to create some nested directories
if [ ! -e $filePath ]
then
	mkdir -p $filePath
fi

# Has a side effect in form of output but overall is ok
echo $writestr > $writefile
