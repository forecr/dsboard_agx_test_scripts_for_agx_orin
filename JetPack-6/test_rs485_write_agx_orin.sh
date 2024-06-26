#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip0 - tegra234-gpio
#gpiochip1 - tegra234-gpio-aon

gpioset --mode=signal `gpiofind "PM.04"`=1 &
PID_RS422_232=$!
gpioset --mode=signal `gpiofind "PN.01"`=1 &
PID_HALF_FULL=$!
gpioset --mode=signal `gpiofind "PEE.05"`=1 &
PID_RS485_CTRL=$!

sudo gtkterm -p /dev/ttyTHS3 -s 115200 -w RS485

kill $PID_RS422_232
kill $PID_HALF_FULL
kill $PID_RS485_CTRL

