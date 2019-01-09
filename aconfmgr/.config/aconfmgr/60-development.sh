# Developer tools.
AddPackage cloc # Count lines of code
AddPackage cmake # A cross-platform open-source make system
AddPackage --foreign emacs-git # GNU Emacs. Development.
AddPackage gdb # The GNU Debugger
AddPackage git-crypt # Transparent file encryption in Git
AddPackage --foreign git-extras # GIT utilities -- repo summary, commit counting, repl, changelog population and more
AddPackage go # Core compiler tools for the Go programming language
AddPackage highlight # Fast and flexible source code highlighter (CLI version)
AddPackage hub # cli interface for Github
AddPackage npm # A package manager for javascript
AddPackage qemu # A generic and open source machine emulator and virtualizer
AddPackage rust # Systems programming language focused on safety, speed and concurrency
AddPackage scons # Extensible Python-based build utility

# C/C++.
AddPackage clang # C language family frontend for LLVM
AddPackage llvm # Collection of modular and reusable compiler and toolchain technologies

# Python.
AddPackage flake8 # The modular source code checker
AddPackage ipython # An enhanced Interactive Python shell.
AddPackage mypy # Optional static typing for Python 2 and 3 (PEP484)
AddPackage --foreign python-autoflake # Removes unused imports and unused variables
AddPackage --foreign python-flake8-mypy # A plugin for flake8 integrating mypy.
AddPackage --foreign python-importmagic # Automatically manage imports in Python
AddPackage python-isort # A Python utility / library to sort Python imports.
AddPackage python-mutagen # An audio metadata tag reader and writer library for Python 3
AddPackage --foreign python-spotipy-git # Simple client for the Spotify Web API
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage python-virtualenvwrapper # Extensions to Ian Bicking's virtualenv tool
AddPackage --foreign python36 # Major release 3.6 of the Python high-level programming language
AddPackage yapf # Python style guide checker

# PHP.
AddPackage composer # Dependency Manager for PHP
AddPackage php # A general-purpose scripting language that is especially suited to web development
AddPackage php-gd # gd module for PHP
# PHP configuration.
CopyFile /etc/php/php.ini

# Web development.
AddPackage aws-cli # Universal Command Line Interface for Amazon Web Services
AddPackage --foreign heroku-cli # a tool for creating and managing Heroku apps from the command line
AddPackage postgresql # Sophisticated object-relational DBMS
AddPackage rabbitmq # Highly reliable and performant enterprise messaging implementation of AMQP written in Erlang/OTP
AddPackage redis # Advanced key-value store
AddPackage yarn # Fast, reliable, and secure dependency management
