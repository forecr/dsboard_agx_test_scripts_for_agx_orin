#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi


sudo echo 428 > /sys/class/gpio/export 
sudo echo 433 > /sys/class/gpio/export 
sudo echo low > /sys/class/gpio/PM.04/direction 
sudo echo low > /sys/class/gpio/PN.01/direction 

sudo gtkterm -p /dev/ttyTHS4 -s 115200

sudo echo 428 > /sys/class/gpio/unexport
sudo echo 433 > /sys/class/gpio/unexport

