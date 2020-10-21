# Man pages.
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages

# Use neovim as vi.
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
CreateLink /usr/local/bin/vi /usr/bin/nvim

# Shell and shell extensions.
AddPackage --foreign autojump # A faster way to navigate your filesystem from the command line
AddPackage fzf # Command-line fuzzy finder
AddPackage grml-zsh-config # grml's zsh setup
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage --foreign zsh-fast-syntax-highlighting-git # Optimized and extended zsh-syntax-highlighting

# Shell utilities.
AddPackage asciinema # Record and share terminal sessions
AddPackage htop # Interactive process viewer
AddPackage lsof # Lists open files for running Unix processes
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage pastebinit # Send anything you want directly to a pastebin from the command line
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage stow # Manage installation of multiple softwares in the same directory tree
AddPackage the_silver_searcher # Code searching tool similar to Ack, but faster
AddPackage tmux # A terminal multiplexer
AddPackage tree # A directory listing program displaying a depth indented list of files

# Media.
AddPackage playerctl # mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others.
AddPackage youtube-dl # A command-line program to download videos from YouTube.com and a few more sites

# Ranger.
AddPackage ranger # Simple, vim-like file manager
AddPackage atool # A script for managing file archives of various types
AddPackage elinks # An advanced and well-established feature-rich text mode web browser.
AddPackage highlight # Fast and flexible source code highlighter (CLI version)

# Archives.
AddPackage p7zip # Command-line file archiver with high compression ratio
AddPackage unp # A script for unpacking a wide variety of archive formats
AddPackage unrar # The RAR uncompression program
AddPackage unzip # For extracting and viewing files in .zip archives

# Arch-specific utilities.
AddPackage --foreign aurvote # Tool to vote for favorite AUR packages
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.
CopyFile /etc/xdg/reflector/reflector.conf
