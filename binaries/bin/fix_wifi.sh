#!/bin/sh

sudo rmmod iwlmvm
sudo rmmod iwlwifi
sudo modprobe iwlwifi iwlmvm
