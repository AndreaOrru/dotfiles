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
      python36
      python36Packages.virtualenv
      python36Packages.virtualenvwrapper
      sbcl
      ruby_2_4

      # X applications
      chromium
      emacs
      mpv
      signal-desktop
      spotify
      termite
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
