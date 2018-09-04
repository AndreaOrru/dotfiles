{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # Shell extensions
      autojump
      direnv
      fzf
      grml-zsh-config

      # Shell programs
      htop
      neovim
      nox
      pastebinit
      psmisc
      pulsemixer
      ranger
      ripgrep
      unp
      wget

      # Developer tools
      aws
      binutils
      gdb
      git
      gitAndTools.git-extras
      gitAndTools.hub

      # Programming languages
      gcc8
      nodejs
      python36Full
      ruby_2_4
      sbcl

      # Python packages
      autoflake
      mypy
      python36Packages.flake8
      python36Packages.importmagic
      python36Packages.ipython
      python36Packages.isort
      python36Packages.virtualenv
      python36Packages.virtualenvwrapper
      python36Packages.yapf

      # X applications
      chromium
      emacs
      kitty
      mpv
      signal-desktop
      spotify
      xcape
      xsel
    ];
  };

  fonts = {
    fonts = with pkgs; [
      google-fonts
      mononoki
    ];
  };
}
