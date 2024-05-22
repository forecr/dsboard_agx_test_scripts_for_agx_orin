#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip0 - tegra234-gpio
#gpiochip1 - tegra234-gpio-aon

gpioset --mode=signal `gpiofind "PM.04"`=0 &
PID_RS422_232=$!
gpioset --mode=signal `gpiofind "PN.01"`=0 &
PID_HALF_FULL=$!

sudo gtkterm -p /dev/ttyTHS3 -s 115200

kill $PID_RS422_232
kill $PID_HALF_FULL

