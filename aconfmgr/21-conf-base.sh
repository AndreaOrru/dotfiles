# Boot loader.
CopyFile /boot/loader/entries/arch.conf 755
CopyFile /boot/loader/entries/arch-ck.conf 755
CopyFile /boot/loader/loader.conf 755

CopyFile /etc/sudoers           # Sudo for wheel group.
CopyFile /etc/sysctl.d/vm.conf  # Kernel virtual memory options.
CopyFile /etc/tmux.conf         # TMux configuration.
CopyFile /etc/vconsole.conf     # Bigger console fonts.

# Blacklisted modules.
CopyFile /etc/modprobe.d/nowatchdog.conf

# Neovim is Vi.
CreateLink /usr/local/bin/vi /usr/bin/nvim

# Early KMS.
if [[ "$HOSTNAME" == "toxicity" ]]; then
sed -i -f - "$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)" <<EOF
  s/^MODULES=.*/MODULES=(amdgpu)/
  s/fsck)$/resume fsck)/
EOF

else
sed -i -f - "$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)" <<EOF
  s/^MODULES=.*/MODULES=(i915)/
  s/fsck)$/resume fsck)/
EOF
fi
