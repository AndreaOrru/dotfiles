AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage gimp # GNU Image Manipulation Program
AddPackage kitty # A modern, hackable, featureful, OpenGL based terminal emulator
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage xcape # Configure modifier keys to act as other keys when pressed and released on their own
AddPackage xsel # XSel is a command-line program for getting and setting the contents of the X selection
AddPackage youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites

AddPackage --foreign emacs-git # GNU Emacs. Development.
AddPackage --foreign spotify # A proprietary music streaming service
AddPackage --foreign postman-bin # Build, test, and document your APIs faster
AddPackage --foreign ttf-google-fonts-git # TrueType fonts from the Google Fonts project (git version)
AddPackage --foreign ttf-mononoki-git # Monospace font for programmers, successor of monoOne

if [[ "$HOSTNAME" == "toxicity" ]]; then
  AddPackage feh # Fast and light imlib2-based image viewer
  AddPackage i3lock # An improved screenlocker based upon XCB and PAM
  AddPackage rofi # A window switcher, application launcher and dmenu replacement
  AddPackage scrot # Simple command-line screenshot utility for X
  AddPackage xss-lock # Use external locker as X screen saver
  AddPackage zathura # Minimalistic document viewer
  AddPackage zathura-djvu # DjVu support for Zathura
  AddPackage zathura-pdf-mupdf # PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)
fi
