LAPTOP=false
WORKSTATION=false
AMD_GRAPHICS=false
INTEL_GRAPHICS=false

case "$HOSTNAME" in
  badwater)
    WORKSTATION=true
    INTEL_GRAPHICS=true
    ;;
  manhattan)
    LAPTOP=true
    INTEL_GRAPHICS=true
    ;;
  toxicity)
    WORKSTATION=true
    AMD_GRAPHICS=true
    ;;
esac
