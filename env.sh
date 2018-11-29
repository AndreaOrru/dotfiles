LINUX=false
MAC_OS=false
LAPTOP=false
WORKSTATION=false
AMD_GRAPHICS=false
INTEL_GRAPHICS=false

case "$HOSTNAME" in
  manhattan)
    LINUX=true
    LAPTOP=true
    INTEL_GRAPHICS=true
    ;;
  navi)
    MAC_OS=true
    LAPTOP=true
    ;;
  toxicity)
    LINUX=true
    WORKSTATION=true
    AMD_GRAPHICS=true
    ;;
esac
