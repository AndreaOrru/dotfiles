# Base groups.
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackageGroup base-devel
AddPackage logrotate # Rotates system logs automatically
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages

# Linux kernel.
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-pf-skylake # The pf-kernel and modules
AddPackage linux-pf-headers-skylake # Headers and scripts for building modules for the pf-kernel
CopyFile /etc/mkinitcpio.d/linux-pf.preset

# Kernel Same Page Merging.
AddPackage --foreign uksmd-git # Userspace KSM helper daemon
CreateLink /etc/systemd/system/multi-user.target.wants/uksmd.service /usr/lib/systemd/system/uksmd.service

# Boot loader configuration.
CopyFile /boot/loader/loader.conf 755
CopyFile /boot/loader/entries/arch-pf.conf 755

# Kernel options.
CopyFile /etc/modprobe.d/no-watchdog.conf  # Disable watchdogs.
CopyFile /etc/sysctl.d/no-coredump.conf    # Disable core dumps.
CopyFile /etc/sysctl.d/vm.conf             # Virtual memory options.

# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

# Sudo for wheel group.
CopyFile /etc/sudoers

# Arch tools.
CopyFile /etc/makepkg.conf
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist

# Additional Arch tools.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign aurvote # Tool to vote for favorite AUR packages
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage --foreign systemd-boot-pacman-hook # Pacman hook to upgrade systemd-boot after systemd upgrade.
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

# No stop jobs.
CopyFile /etc/systemd/logind.conf
CopyFile /etc/systemd/system.conf
CopyFile /etc/systemd/user.conf
# Limit the size of systemd's journal.
CopyFile /etc/systemd/journald.conf
