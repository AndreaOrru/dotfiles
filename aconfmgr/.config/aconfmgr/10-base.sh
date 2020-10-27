# Base groups.
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackageGroup base-devel

# Linux kernel.
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-pf-skylake # The pf-kernel and modules
AddPackage linux-pf-headers-skylake # Headers and scripts for building modules for the pf-kernel
CopyFile /etc/mkinitcpio.d/linux-pf.preset
CopyFile /etc/mkinitcpio.conf

# Kernel Same Page Merging.
AddPackage --foreign uksmd-git # Userspace KSM helper daemon
CreateLink /etc/systemd/system/multi-user.target.wants/uksmd.service /usr/lib/systemd/system/uksmd.service

# Boot loader configuration.
AddPackage --foreign systemd-boot-pacman-hook # Pacman hook to upgrade systemd-boot after systemd upgrade.
CopyFile /boot/loader/loader.conf 755
CopyFile /boot/loader/entries/arch.conf 755

# Kernel options.
CopyFile /etc/modprobe.d/no-watchdog.conf
CopyFile /etc/sysctl.d/no-coredump.conf
CopyFile /etc/sysctl.d/vm.conf

# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

# Sudo for wheel group.
CopyFile /etc/sudoers

# Arch tools.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
CopyFile /etc/makepkg.conf
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist

# Systemd.
AddPackage logrotate # Rotates system logs automatically
CopyFile /etc/systemd/journald.conf  # Limit size of journal.
CopyFile /etc/systemd/system.conf    # Faster stop jobs.
