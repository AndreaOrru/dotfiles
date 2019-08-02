#!/bin/sh

sleep 1
sudo rmmod i2c_hid
sleep 1
sudo modprobe i2c_hid
