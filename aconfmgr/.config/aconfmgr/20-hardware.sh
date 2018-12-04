AddPackage intel-ucode # Microcode update files for Intel CPUs
AddPackage --foreign python-undervolt # Undervolt Intel CPUs under Linux

# Undervolt service.
CopyFileTo "/etc/systemd/system/undervolt-$HOSTNAME.service" "/etc/systemd/system/undervolt.service"
CreateLink /etc/systemd/system/hibernate.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/hybrid-sleep.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/multi-user.target.wants/undervolt.service /etc/systemd/system/undervolt.service
CreateLink /etc/systemd/system/suspend.target.wants/undervolt.service /etc/systemd/system/undervolt.service


if [ "$LAPTOP" == true ]; then
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
fi


# Enable early KMS, and disable fsck (at this stage).
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


# Extra i915 options.
if [ "$INTEL_GRAPHICS" == true ]; then
    CopyFile /etc/modprobe.d/i915.conf
fi