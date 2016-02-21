#!/bin/bash

# A script for mounting my windows drives. 
# Toggles between mounting/unmounting upon calling.

# $1 - The drive to mount (C, D, F..)

# modify this to mount the correct device from the /dev folder.
# Mine are sda2, sda4
case $1 in
	C )
		name=sda2 ;;
	D )
		name=sda4 ;;
	* )
		echo "Invalid input"
		exit 0
esac	

result=$(grep $name /proc/mounts)

if [ "$result" == "" ]; then
	mount /dev/$name /mnt/$1
	if [ $? == "0" ]; then
		echo "Device $name has been mounted"
	else
		echo "An error has occured."
	fi
else
	umount /dev/$name
	if [ $? == "0" ]; then
		echo "Device $name has been unmounted"
	else
		echo "An error has occured."
	fi
fi

