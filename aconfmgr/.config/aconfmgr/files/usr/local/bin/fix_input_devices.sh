#!/bin/sh

systemctl restart udevmon &

rmmod i2c_hid
sleep 2
modprobe i2c_hid
