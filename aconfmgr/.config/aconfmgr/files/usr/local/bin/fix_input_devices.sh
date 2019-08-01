#!/bin/sh

sudo systemctl restart udevmon &

sudo rmmod i2c_hid
sleep 2
sudo modprobe i2c_hid
