####################
#  Sane behaviour  #
####################

# No stop jobs...
CopyFile /etc/systemd/logind.conf
CopyFile /etc/systemd/system.conf
CopyFile /etc/systemd/user.conf
# Don't wait for devices to settle.
CreateLink /etc/systemd/system/systemd-udev-settle.service /dev/null


##############
#  Defaults  #
##############

# Systemd defaults.
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
# Misc.
CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket


#################
#  Silent boot  #
#################

# Enable silent fsck (was disabled in mkinitcpio).
cat > "$(CreateFile /etc/systemd/system/systemd-fsck-root.service)" <<EOF
$(AconfGetPackageOriginalFile systemd /usr/lib/systemd/system/systemd-fsck-root.service)
StandardOutput=null
StandardError=journal+console
EOF

cat > "$(CreateFile /etc/systemd/system/systemd-fsck@.service)" <<EOF
$(AconfGetPackageOriginalFile systemd /usr/lib/systemd/system/systemd-fsck@.service)
StandardOutput=null
StandardError=journal+console
EOF


###################
#  Miscellaneous  #
###################

# Disable core dumps.
CopyFile /etc/systemd/coredump.conf

# Time synchronization.
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
# Filesystem TRIM for SSD drives.
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
