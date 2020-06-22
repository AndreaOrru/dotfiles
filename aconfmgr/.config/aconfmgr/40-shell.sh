# Use neovim as vi.
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
CreateLink /usr/local/bin/vi /usr/bin/nvim

# Shell and shell extensions.
AddPackage --foreign autojump # A faster way to navigate your filesystem from the command line
AddPackage --foreign direnv # a shell extension that manages your environment
AddPackage fzf # Command-line fuzzy finder
AddPackage grml-zsh-config # grml's zsh setup
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage --foreign zsh-fast-syntax-highlighting-git # Optimized and extended zsh-syntax-highlighting

# Shell utilities.
AddPackage asciinema # Record and share terminal sessions
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage htop # Interactive process viewer
AddPackage lsof # Lists open files for running Unix processes
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage pastebinit # Send anything you want directly to a pastebin from the command line
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage stow # Manage installation of multiple softwares in the same directory tree
AddPackage the_silver_searcher # Code searching tool similar to Ack, but faster
AddPackage tmux # A terminal multiplexer
AddPackage tree # A directory listing program displaying a depth indented list of files

# Ranger.
AddPackage ranger # Simple, vim-like file manager
AddPackage highlight # Fast and flexible source code highlighter (CLI version)

# Archives.
AddPackage atool # A script for managing file archives of various types
AddPackage p7zip # Command-line file archiver with high compression ratio
AddPackage unp # A script for unpacking a wide variety of archive formats
AddPackage unrar # The RAR uncompression program

# Media.
AddPackage alsa-utils # An alternative implementation of Linux sound support
AddPackage imagemagick # An image viewing/manipulation program
AddPackage mps-youtube # Terminal based YouTube jukebox with playlist management
AddPackage pamixer # Pulseaudio command-line mixer like amixer
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
AddPackage youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites
