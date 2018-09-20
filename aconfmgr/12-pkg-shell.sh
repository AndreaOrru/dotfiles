# Laptop specific.
if [[ "$HOSTNAME" == "manhattan" ]]; then
  AddPackage dhclient # A standalone DHCP client from the dhcp package
  AddPackage networkmanager # Network connection manager and user applications
  AddPackage tlp # Linux Advanced Power Management
  AddPackage x86_energy_perf_policy # Read or write MSR_IA32_ENERGY_PERF_BIAS
fi

# Arch Linux specific.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign agetpkg # Arch Linux Archive Get Package
AddPackage --foreign aurvote # Tool to vote for favorite AUR packages
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

# Shell and shell extensions.
AddPackage autojump # A faster way to navigate your filesystem from the command line
AddPackage --foreign direnv # a shell extension that manages your environment
AddPackage grml-zsh-config # grml's zsh setup
AddPackage fzf # Command-line fuzzy finder
AddPackage xonsh # Python-powered, cross-platform, Unix-gazing shell
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage --foreign zsh-fast-syntax-highlighting-git # Optimized and extended zsh-syntax-highlighting

# Shell utilities.
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage mlocate # Merging locate/updatedb implementation
AddPackage pastebinit # Send anything you want directly to a pastebin from the command line
AddPackage ranger # A simple, vim-like file manager
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage the_silver_searcher # Code searching tool similar to Ack, but faster
AddPackage tmux # A terminal multiplexer
AddPackage --foreign tmux-current-pane-hostname-git # Tmux plugin that enables displaying hostname and user of the current pane in your status bar
AddPackage tree # A directory listing program displaying a depth indented list of files

# Archives.
AddPackage atool # A script for managing file archives of various types
AddPackage p7zip # Command-line file archiver with high compression ratio
AddPackage unp # A script for unpacking a wide variety of archive formats
AddPackage unrar # The RAR uncompression program

# Networking.
AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage autossh # Automatically restart SSH sessions and tunnels
AddPackage elinks # An advanced and well-established feature-rich text mode web browser.
AddPackage rsync # A file transfer program to keep remote files in sync
AddPackage ufw # Uncomplicated and easy to use CLI tool for managing a netfilter firewall
AddPackage wget # Network utility to retrieve files from the Web

# Media.
AddPackage alsa-utils # An alternative implementation of Linux sound support
AddPackage imagemagick # An image viewing/manipulation program
AddPackage pulsemixer # CLI and curses mixer for pulseaudio

# Developer tools.
AddPackage git # the fast distributed version control system
AddPackage git-crypt # Transparent file encryption in Git
AddPackage --foreign git-extras # GIT utilities -- repo summary, commit counting, repl, changelog population and more
AddPackage go # Core compiler tools for the Go programming language
AddPackage highlight # Fast and flexible source code highlighter (CLI version)
AddPackage hub # cli interface for Github
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage npm # A package manager for javascript

# Web development.
AddPackage aws-cli # Universal Command Line Interface for Amazon Web Services
AddPackage --foreign heroku-cli # a tool for creating and managing Heroku apps from the command line
AddPackage postgresql # Sophisticated object-relational DBMS
AddPackage rabbitmq # Highly reliable and performant enterprise messaging implementation of AMQP written in Erlang/OTP
AddPackage redis # Advanced key-value store
AddPackage yarn # Fast, reliable, and secure dependency management

# Python stuff.
AddPackage ipython # An enhanced Interactive Python shell.
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage python-virtualenvwrapper # Extensions to Ian Bicking's virtualenv tool
AddPackage --foreign python36 # Major release 3.6 of the Python high-level programming language
