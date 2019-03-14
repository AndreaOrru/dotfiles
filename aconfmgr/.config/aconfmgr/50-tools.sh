# Shell and shell extensions.
AddPackage autojump # A faster way to navigate your filesystem from the command line
AddPackage --foreign direnv # a shell extension that manages your environment
AddPackage grml-zsh-config # grml's zsh setup
AddPackage fzf # Command-line fuzzy finder
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage --foreign zsh-fast-syntax-highlighting-git # Optimized and extended zsh-syntax-highlighting

# Add ~/bin to the PATHs.
CopyFile /etc/profile.d/homebin.sh


# Shell utilities.
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage htop # Interactive process viewer
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage pastebinit # Send anything you want directly to a pastebin from the command line
AddPackage powerline # Statusline plugin for vim, and provides statuslines and prompts for several other applications, including zsh, bash, tmux, IPython, Awesome, i3 and Qtile
AddPackage ranger # A simple, vim-like file manager
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage stow # Manage installation of multiple softwares in the same directory tree
AddPackage the_silver_searcher # Code searching tool similar to Ack, but faster
AddPackage tmux # A terminal multiplexer
AddPackage tree # A directory listing program displaying a depth indented list of files

# Archives.
AddPackage atool # A script for managing file archives of various types
AddPackage p7zip # Command-line file archiver with high compression ratio
AddPackage unp # A script for unpacking a wide variety of archive formats
AddPackage unrar # The RAR uncompression program
AddPackage unzip # For extracting and viewing files in .zip archives

# Media.
AddPackage alsa-utils # An alternative implementation of Linux sound support
AddPackage imagemagick # An image viewing/manipulation program
AddPackage mpd # Flexible, powerful, server-side application for playing music
AddPackage --foreign mpdris2-py3-git # MPRIS2 support for MPD using Python 3 -- git version
AddPackage mps-youtube # Terminal based YouTube jukebox with playlist management
AddPackage ncmpcpp # Almost exact clone of ncmpc with some new features
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
AddPackage youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites
