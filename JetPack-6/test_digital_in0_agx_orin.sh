#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip2 - pcf8574a
watch -n 0.1 gpioget 2 0

