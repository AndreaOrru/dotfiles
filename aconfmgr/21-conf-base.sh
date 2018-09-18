# Host name.
CopyFile /etc/hostname
CopyFile /etc/hosts

CopyFile /etc/mkinitcpio.conf   # Kernel initrd.
CopyFile /etc/sudoers           # Sudo for wheel group.
CopyFile /etc/sysctl.d/vm.conf  # Kernel virtual memory options.
CopyFile /etc/vconsole.conf     # Bigger console fonts.

CopyFile /etc/tmux.conf         # TMux configuration.

# Neovim is Vi.
CreateLink /usr/local/bin/vi /usr/bin/nvim
