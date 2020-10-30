######################
#  Power management  #
######################

AddPackage tlp # Linux Advanced Power Management
AddPackage tlp-rdw # Linux Advanced Power Management - Radio Device Wizard
AddPackage acpi_call-dkms # A linux kernel module that enables calls to ACPI methods through /proc/acpi/call - module sources
AddPackage ethtool # Utility for controlling network drivers and hardware
AddPackage tpacpi-bat # A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi
AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS

CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CreateLink /etc/systemd/system/systemd-rfkill.service /dev/null
CreateLink /etc/systemd/system/systemd-rfkill.socket /dev/null

CopyFile /etc/tlp.conf

# Suspend then hibernate after a while.
CopyFile /etc/systemd/sleep.conf
CreateLink /etc/systemd/system/systemd-suspend.service /usr/lib/systemd/system/systemd-suspend-then-hibernate.service


###############
#  Undervolt  #
###############

AddPackage --foreign python-undervolt # Undervolt Intel CPUs under Linux

CreateLink /etc/systemd/system/hibernate.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/multi-user.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/suspend.target.wants/undervolt.service /etc/systemd/system/undervolt.service

CopyFile /etc/systemd/system/undervolt.service


###############
#  Bluetooth  #
###############

AddPackage bluez # Daemons for the bluetooth protocol stack
AddPackage bluez-plugins # bluez plugins (PS3 Sixaxis controller)
AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack

CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service

CopyFile /etc/bluetooth/main.conf


##############
#  Graphics  #
##############

AddPackage intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
AddPackage vulkan-intel # Intel's Vulkan mesa driver

CopyFile /etc/modprobe.d/i915.conf


###########
#  Audio  #
###########

AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities
AddPackage pulseaudio # A featureful, general-purpose sound server
AddPackage pulseaudio-alsa # ALSA Configuration for PulseAudio
AddPackage pulseaudio-bluetooth # Bluetooth support for PulseAudio
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket

AddPackage sof-firmware # Sound Open Firmware
CopyFile /etc/modprobe.d/no-wrong-audio.conf
CopyFile /etc/pulse/default.pa


###################
#  Miscellaneous  #
###################

AddPackage intel-ucode # Microcode update files for Intel CPUs

# Firmware update.
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage udisks2 # Disk Management Service, version 2

# Periodic SSD trim.
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
