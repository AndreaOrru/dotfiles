###############
#  Undervolt  #
###############

AddPackage intel-ucode # Microcode updat files for Intel CPUs
AddPackage --foreign python-undervolt # Undervolt Intel CPUs under Linux

CopyFile /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/hibernate.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/multi-user.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/suspend.target.wants/undervolt.service /etc/systemd/system/undervolt.service


##############
#  Graphics  #
##############

# Enable early KMS, and disable fsck (at this stage) for silent boot.
sed -i -f - "$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)" <<EOF
s/^MODULES=.*/MODULES=(i915)/
s/fsck)$/resume)/
EOF

# Extra i915 options.
CopyFile /etc/modprobe.d/i915.conf


###############
#  Bluetooth  #
###############

AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack

# Enable Bluetooth services.
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service

# Automatically switch to newly connected audio devices.
cat >> "$(GetPackageOriginalFile pulseaudio /etc/pulse/default.pa)" <<EOF
load-module module-switch-on-connect
EOF


######################
#  Power Management  #
######################

AddPackage tlp # Linux Advanced Power Management
AddPackage tlp-rdw # Linux Advanced Power Management - Radio Device Wizard
AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS

# TLP services.
CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CreateLink /etc/systemd/system/sleep.target.wants/tlp-sleep.service /usr/lib/systemd/system/tlp-sleep.service
CreateLink /etc/systemd/system/systemd-rfkill.service /dev/null
CreateLink /etc/systemd/system/systemd-rfkill.socket /dev/null
# Power management options.
CopyFile /etc/default/tlp

# Suspend then hibernate after some time.
CopyFile /etc/systemd/sleep.conf
CreateLink /etc/systemd/system/systemd-suspend.service /usr/lib/systemd/system/systemd-suspend-then-hibernate.service
# Always react to lid events.
CopyFile /etc/systemd/logind.conf

# Shut down bluetooth before sleeping, restart after resume.
CopyFile /etc/systemd/system/bluetooth-resume.service
CopyFile /etc/systemd/system/bluetooth-sleep.service
CreateLink /etc/systemd/system/hibernate.target.wants/bluetooth-resume.service /etc/systemd/system/bluetooth-resume.service
CreateLink /etc/systemd/system/hibernate.target.wants/bluetooth-sleep.service /etc/systemd/system/bluetooth-sleep.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/bluetooth-resume.service /etc/systemd/system/bluetooth-resume.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/bluetooth-sleep.service /etc/systemd/system/bluetooth-sleep.service
CreateLink /etc/systemd/system/sleep.target.wants/bluetooth-sleep.service /etc/systemd/system/bluetooth-sleep.service
CreateLink /etc/systemd/system/suspend.target.wants/bluetooth-resume.service /etc/systemd/system/bluetooth-resume.service
