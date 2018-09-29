#
# xorg-drivers group
#

if [[ "$HOSTNAME" == "toxicity" ]]; then
  AddPackage xf86-video-amdgpu # X.org amdgpu video driver
else
  AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
fi


#
# xorg group
#

#AddPackage xf86-video-vesa # X.org vesa video driver
AddPackage xorg-bdftopcf # Convert X font from Bitmap Distribution Format to Portable Compiled Format
AddPackage xorg-docs # X.org documentations
AddPackage xorg-font-util # X.Org font utilities
AddPackage xorg-fonts-100dpi # X.org 100dpi fonts
AddPackage xorg-fonts-75dpi # X.org 75dpi fonts
AddPackage xorg-fonts-encodings # X.org font encoding files
AddPackage xorg-iceauth # ICE authority file utility
AddPackage xorg-luit # Filter that can be run between an arbitrary application and a UTF-8 terminal emulator
AddPackage xorg-mkfontdir # Create an index of X font files in a directory
AddPackage xorg-mkfontscale # Create an index of scalable font files for X
AddPackage xorg-server # Xorg X server
AddPackage xorg-server-common # Xorg server common files
AddPackage xorg-server-devel # Development files for the X.Org X server
AddPackage xorg-server-xdmx # Distributed Multihead X Server and utilities
AddPackage xorg-server-xephyr # A nested X server that runs as an X application
AddPackage xorg-server-xnest # A nested X server that runs as an X application
AddPackage xorg-server-xvfb # Virtual framebuffer X server
AddPackage xorg-server-xwayland # run X clients under wayland
AddPackage xorg-sessreg # Register X sessions in system utmp/utmpx databases
AddPackage xorg-setxkbmap # Set the keyboard using the X Keyboard Extension
AddPackage xorg-smproxy # Allows X applications that do not support X11R6 session management to participate in an X11R6 session
AddPackage xorg-x11perf # Simple X server performance benchmarker
AddPackage xorg-xauth # X.Org authorization settings program
AddPackage xorg-xbacklight # RandR-based backlight control application
AddPackage xorg-xcmsdb # Device Color Characterization utility for X Color Management System
AddPackage xorg-xcursorgen # Create an X cursor file from PNG images
AddPackage xorg-xdpyinfo # Display information utility for X
AddPackage xorg-xdriinfo # Query configuration information of DRI drivers
AddPackage xorg-xev # Print contents of X events
AddPackage xorg-xgamma # Alter a monitor's gamma correction
AddPackage xorg-xhost # Server access control program for X
AddPackage xorg-xinput # Small commandline tool to configure devices
AddPackage xorg-xkbcomp # X Keyboard description compiler
AddPackage xorg-xkbevd # XKB event daemon
AddPackage xorg-xkbutils # XKB utility demos
AddPackage xorg-xkill # Kill a client by its X resource
AddPackage xorg-xlsatoms # List interned atoms defined on server
AddPackage xorg-xlsclients # List client applications running on a display
AddPackage xorg-xmodmap # Utility for modifying keymaps and button mappings
AddPackage xorg-xpr # Print an X window dump from xwd
AddPackage xorg-xprop # Property displayer for X
AddPackage xorg-xrandr # Primitive command line interface to RandR extension
AddPackage xorg-xrdb # X server resource database utility
AddPackage xorg-xrefresh # Refresh all or part of an X screen
AddPackage xorg-xset # User preference utility for X
AddPackage xorg-xsetroot # Classic X utility to set your root window background to a given pattern or color
AddPackage xorg-xvinfo # Prints out the capabilities of any video adaptors associated with the display that are accessible through the X-Video extension
AddPackage xorg-xwd # X Window System image dumping utility
AddPackage xorg-xwininfo # Command-line utility to print information about windows on an X server
AddPackage xorg-xwud # X Window System image undumping utility
