AddPackageGroup xorg

RemovePackage xf86-video-vesa # X.org vesa video driver


if [[ "$HOSTNAME" == "toxicity" ]]; then
  AddPackage xf86-video-amdgpu # X.org amdgpu video driver
else
  AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
fi
