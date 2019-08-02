# Base groups.
AddPackageGroup base
AddPackageGroup base-devel
AddPackage linux-headers # Header files and scripts for building modules for Linux kernel

# Linux LTS kernel.
AddPackage linux-lts # The Linux-lts kernel and modules
AddPackage linux-lts-headers # Header files and scripts for building modules for Linux-lts kernel
# Prevent loading non-existing (on LTS) module.
CopyFile /etc/modules-load.d/pkcs8.conf

# Boot loader configuration.
CopyFile /boot/loader/loader.conf 755
CopyFile /boot/loader/entries/arch.conf 755
CopyFile /boot/loader/entries/arch-lts.conf 755

# Kernel options.
CopyFile /etc/modprobe.d/no-watchdog.conf  # Disable watchdogs.
CopyFile /etc/sysctl.d/no-coredump.conf    # Disable core dumps.
CopyFile /etc/sysctl.d/vm.conf             # Virtual memory options.

# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

CopyFile /etc/sudoers        # Sudo for wheel group.
CopyFile /etc/vconsole.conf  # Bigger console fonts.

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
