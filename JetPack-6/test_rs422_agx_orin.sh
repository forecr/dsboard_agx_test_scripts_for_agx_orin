#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip0 - tegra234-gpio
#gpiochip1 - tegra234-gpio-aon

gpioset --mode=signal `gpiofind "PM.04"`=1 &
PID_RS422_232=$!
gpioset --mode=signal `gpiofind "PN.01"`=0 &
PID_HALF_FULL=$!

trap interrupt_func INT
interrupt_func() {
	kill $PID_RS422_232
	kill $PID_HALF_FULL
}

# Check the system is JetPack-5.x based
if [ "$(cat /etc/nv_tegra_release | grep -c '# R35')" = "1" ]; then
	sudo gtkterm -p /dev/ttyTHS4 -s 115200
else
	sudo gtkterm -p /dev/ttyTHS2 -s 115200
fi

