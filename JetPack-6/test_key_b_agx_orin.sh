#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip0 - tegra234-gpio
#gpiochip1 - tegra234-gpio-aon

gpioset --mode=signal `gpiofind "PQ.04"`=1 &
PID_M2B_ENABLE1=$!
gpioset --mode=signal `gpiofind "PP.04"`=1 &
PID_M2B_ENABLE2=$!
gpioset --mode=signal `gpiofind "PA.02"`=1 &
PID_M2B_FULLCARD_PWRON=$!
gpioset --mode=signal `gpiofind "PP.06"`=0 &
PID_M2B_RESET=$!
gpioset --mode=signal `gpiofind "PA.01"`=1 &
PID_M2B_PWRON=$!

trap interrupt_func INT
interrupt_func() {
	kill $PID_M2B_ENABLE1
	kill $PID_M2B_ENABLE2
	kill $PID_M2B_FULLCARD_PWRON
	kill $PID_M2B_RESET
	kill $PID_M2B_PWRON
}

watch -n 0.1 lsusb

