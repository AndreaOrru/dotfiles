function AddPackageGroup() {
    local group=$1

    for p in $(pacman -Sqg "$group")
    do
        AddPackage "$p"
    done
}
