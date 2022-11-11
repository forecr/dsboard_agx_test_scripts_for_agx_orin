sudo echo 350 > /sys/class/gpio/export
sudo echo 446 > /sys/class/gpio/export
sudo echo 349 > /sys/class/gpio/export

sudo echo high > /sys/class/gpio/PA.02/direction
sudo echo low > /sys/class/gpio/PP.06/direction
sudo echo high > /sys/class/gpio/PA.01/direction

watch -n 0.1 lsusb
sudo echo 350 > /sys/class/gpio/unexport
sudo echo 446 > /sys/class/gpio/unexport
sudo echo 349 > /sys/class/gpio/unexport

