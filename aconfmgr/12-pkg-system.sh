# Kernel and hardware.
AddPackage intel-ucode # Microcode update files for Intel CPUs
AddPackage linux-zen # The Linux-zen kernel and modules
AddPackage --foreign python-undervolt # Undervolt Intel CPUs under Linux
AddPackage --foreign systemd-boot-pacman-hook # Pacman hook to upgrade systemd-boot after systemd upgrade.

# Arch Linux specific.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign agetpkg # Arch Linux Archive Get Package
AddPackage --foreign aurvote # Tool to vote for favorite AUR packages
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
