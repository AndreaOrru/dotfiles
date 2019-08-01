######################
#  Power management  #
######################

AddPackage tlp # Linux Advanced Power Management
AddPackage tlp-rdw # Linux Advanced Power Management - Radio Device Wizard
AddPackage acpi_call-dkms # A linux kernel module that enables calls to ACPI methods through /proc/acpi/call
AddPackage ethtool # Utility for controlling network drivers and hardware
AddPackage --foreign tp_smapi-dkms # DKMS controlled modules for ThinkPad's SMAPI functionality
AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS

CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CreateLink /etc/systemd/system/sleep.target.wants/tlp-sleep.service /usr/lib/systemd/system/tlp-sleep.service
CreateLink /etc/systemd/system/systemd-rfkill.service /dev/null
CreateLink /etc/systemd/system/systemd-rfkill.socket /dev/null

CopyFile /etc/default/tlp

# Lid switch behaviour.
CopyFile /etc/systemd/logind.conf


######################
#  Pointing devices  #
######################

# Allow TrackPoint and touchpad to work together.
CopyFile /etc/modprobe.d/psmouse.conf

# Restore input devices state after resuming from hibernation.
CopyFile /etc/modprobe.d/no-i2c_i801.conf
CopyFile /usr/local/bin/fix_input_devices.sh 755
CopyFile /etc/systemd/system/fix-input-devices.service
CreateLink /etc/systemd/system/hibernate.target.wants/fix-input-devices.service /etc/systemd/system/fix-input-devices.service


###############
#  Undervolt  #
###############

AddPackage intel-ucode # Microcode update files for Intel CPUs
AddPackage --foreign python-undervolt # Undervolt Intel CPUs under Linux

CreateLink /etc/systemd/system/hibernate.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/multi-user.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/suspend.target.wants/undervolt.service /etc/systemd/system/undervolt.service

CopyFile /etc/systemd/system/undervolt.service


###############
#  Bluetooth  #
###############

AddPackage bluez-tools # A set of tools to manage Bluetooth devices for Linux

CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service


##############
#  Graphics  #
##############

# Early KMS, resume hook.
CopyFile /etc/mkinitcpio.conf

# Intel hardware video acceleration.
AddPackage intel-media-driver # Intel Media Driver for VAAPI — Broadwell+ iGPUs
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
CopyFile /etc/profile.d/libva-driver.sh


###################
#  Miscellaneous  #
###################

# Don't wait for devices to settle.
CreateLink /etc/systemd/system/systemd-udev-settle.service /dev/null

# SSD periodic trim.
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer

# Firmware upgrade.
AddPackage fwupd # A simple daemon to allow session software to update firmware
AddPackage tpm2-abrmd # Trusted Platform Module 2.0 Access Broker and Resource Management Daemon
AddPackage tpm2-tools # Trusted Platform Module 2.0 tools based on tpm2-tss
CopyFile /etc/pacman.d/hooks/fwupd-to-esp.hook
CreateLink /etc/systemd/system/fwupd.service /dev/null
