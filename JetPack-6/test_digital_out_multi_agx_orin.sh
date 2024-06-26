#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#gpiochip2 - pcf8574a
sleep_time=0.3

sleep $sleep_time

echo "DIGITAL_OUT0 OFF"
gpioset 2 4=0
echo "DIGITAL_OUT1 OFF"
gpioset 2 5=0
echo "DIGITAL_OUT2 OFF"
gpioset 2 6=0
sleep $sleep_time

#Single Test
echo "step: 1/14"
echo "DIGITAL_OUT0 ON"
gpioset 2 4=1
sleep $sleep_time

echo "step: 2/14"
echo "DIGITAL_OUT0 OFF"
gpioset 2 4=0
sleep $sleep_time

echo "step: 3/14"
echo "DIGITAL_OUT1 ON"
gpioset 2 5=1
sleep $sleep_time

echo "step: 4/14"
echo "DIGITAL_OUT1 OFF"
gpioset 2 5=0
sleep $sleep_time

echo "step: 5/14"
echo "DIGITAL_OUT2 ON"
gpioset 2 6=1
sleep $sleep_time

echo "step: 6/14"
echo "DIGITAL_OUT2 OFF"
gpioset 2 6=0
sleep $sleep_time

#Double Test
echo "step: 7/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
gpioset 2 4=1
gpioset 2 5=1
sleep $sleep_time

echo "step: 8/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
gpioset 2 4=0
gpioset 2 5=0
sleep $sleep_time

echo "step: 9/14"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
gpioset 2 5=1
gpioset 2 6=1
sleep $sleep_time

echo "step: 10/14"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
gpioset 2 5=0
gpioset 2 6=0
sleep $sleep_time

echo "step: 11/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT2 ON"
gpioset 2 4=1
gpioset 2 6=1
sleep $sleep_time

echo "step: 12/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT2 OFF"
gpioset 2 4=0
gpioset 2 6=0
sleep $sleep_time

#Triple Test
echo "step: 13/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
gpioset 2 4=1
gpioset 2 5=1
gpioset 2 6=1
sleep $sleep_time

echo "step: 14/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
gpioset 2 4=0
gpioset 2 5=0
gpioset 2 6=0

echo "Completed"

sleep 1
gpioset 2 4=1
gpioset 2 5=1
gpioset 2 6=1
sleep 1

sudo echo 312 > /sys/class/gpio/unexport
sudo echo 313 > /sys/class/gpio/unexport
sudo echo 314 > /sys/class/gpio/unexport

