#!/bin/bash

# a script for replacing empty spaces of files in a directory with a dash
# Ex. some dumb folder --> some-dumb-folder.

if [ ! $1 == "" ]; then
	cd $1
fi 

for i in *; do
	destination=$(echo "${i//-}"|tr '[-]+| ' '-')
	mv "$i" "./$destination"
done
