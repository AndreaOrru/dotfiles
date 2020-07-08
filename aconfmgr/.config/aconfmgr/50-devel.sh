# Emacs.
AddPackage --foreign emacs-git # GNU Emacs. Development master branch.
AddPackage dotnet-sdk # The .NET Core SDK
AddPackage --foreign jdtls # Eclipse Java language server

# Developer tools.
AddPackage clang # C language family frontend for LLVM
AddPackage cloc # Count lines of code
AddPackage cmake # A cross-platform open-source make system
AddPackage gdb # The GNU Debugger
AddPackage git # the fast distributed version control system
AddPackage git-crypt # Transparent file encryption in Git
AddPackage --foreign git-extras # GIT utilities -- repo summary, commit counting, repl, changelog population and more
AddPackage hub # cli interface for Github
AddPackage redis # Advanced key-value store
AddPackage scons # Extensible Python-based build utility

# Go, Rust.
AddPackage go # Core compiler tools for the Go programming language
AddPackage rust-analyzer # Experimental Rust compiler front-end for IDEs
AddPackage rustup # The Rust toolchain installer

# Python.
AddPackage ipython # An enhanced Interactive Python shell.
AddPackage --foreign python-pdbpp # pdb++, a drop-in replacement for pdb
AddPackage python-virtualenvwrapper # Extensions to Ian Bicking's virtualenv tool
AddPackage pypy3 # A Python3 implementation written in Python, JIT enabled

# Ruby and webdev.
AddPackage --foreign heroku-cli # a tool for creating and managing Heroku apps from the command line
AddPackage postgresql # Sophisticated object-relational DBMS
AddPackage --foreign rbenv # Simple Ruby version manager
AddPackage --foreign ruby-build # Compile and install Ruby
