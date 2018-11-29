# Base group.
AddPackageGroup base
AddPackage linux-zen # The Linux-zen kernel and modules
RemovePackage jfsutils # JFS filesystem utilities
RemovePackage linux # The Linux kernel and modules
RemovePackage nano # Pico editor clone with enhancements
RemovePackage netctl # Profile based systemd network management
RemovePackage reiserfsprogs # Reiserfs utilities
RemovePackage vi # The original ex/vi text editor
RemovePackage xfsprogs # XFS filesystem utilities

# Boot loader.
CopyFile /boot/loader/loader.conf 755
CopyFile /boot/loader/entries/arch-zen.conf 755

# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

CopyFile /etc/modprobe.d/nowatchdog.conf  # Blacklisted modules.
CopyFile /etc/sudoers                     # Sudo for wheel group.
CopyFile /etc/sysctl.d/vm.conf            # Kernel virtual memory options.
CopyFile /etc/vconsole.conf               # Bigger console fonts.


# Base development group.
AddPackageGroup base-devel
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
# Neovim is Vi.
CreateLink /usr/local/bin/vi /usr/bin/nvim


# Arch Linux specific tools.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign agetpkg # Arch Linux Archive Get Package
AddPackage --foreign aurvote # Tool to vote for favorite AUR packages
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage --foreign systemd-boot-pacman-hook # Pacman hook to upgrade systemd-boot after systemd upgrade.
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

# Optimized compilation.
CopyFile /etc/makepkg.conf
# Pacman.
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
