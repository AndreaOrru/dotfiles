# Boot loader.
CopyFile /boot/loader/entries/arch-zen.conf 755
CopyFile /boot/loader/loader.conf 755

# Localization.
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen

CopyFile /etc/sudoers           # Sudo for wheel group.
CopyFile /etc/sysctl.d/vm.conf  # Kernel virtual memory options.
CopyFile /etc/vconsole.conf     # Bigger console fonts.

# Neovim is Vi.
CreateLink /usr/local/bin/vi /usr/bin/nvim

# Early KMS, and disable fsck (at this stage).
if [ "$AMD_GRAPHICS" == true ]; then
sed -i -f - "$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)" <<EOF
  s/^MODULES=.*/MODULES=(amdgpu)/
  s/fsck)$/resume)/
EOF

elif [ "$INTEL_GRAPHICS" == true ]; then
sed -i -f - "$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)" <<EOF
  s/^MODULES=.*/MODULES=(i915)/
  s/fsck)$/resume)/
EOF
fi

# Blacklisted modules.
CopyFile /etc/modprobe.d/nowatchdog.conf

# Extra i915 options.
if [ "$INTEL_GRAPHICS" == true ]; then
  CopyFile /etc/modprobe.d/i915.conf
fi
