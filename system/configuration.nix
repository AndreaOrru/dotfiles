{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/undervolt.nix
    ./packages.nix
  ];

  boot = {
    blacklistedKernelModules = [
      "iTCO_wdt"        # Disable watchdogs.
      "ideapad_laptop"  # Disable buggy RFKill behaviour.
      "wacom"           # Disable buggy pen driver.
    ];

    cleanTmpDir = true;
    earlyVconsoleSetup = true;

    initrd = {
      kernelModules = [
        "i915"  # Enable early KMS.
      ];
    };

    kernel = {
      sysctl = {
        "vm.dirty_ratio" = 3;             # Memory for dirty pages.
        "vm.dirty_background_ratio" = 1;  # Memory for dirty pages before flusher kicks in.
        "vm.swappiness" = 1;              # Tendency to use swap.
        "vm.vfs_cache_pressure" = 50;     # Tendency to reclaim memory from VFS cache.
      };
    };

    kernelPackages = pkgs.linuxPackages_4_18;

    kernelParams = [
      "nowatchdog"  # Disable watchdogs.
    ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = true;
      };

      timeout = 1;
    };
  };

  environment = {
    shellAliases = {
      # Misc.
      diff = "diff --color=auto";
      f = "sudo updatedb && sudo locate -i";
      pastebinit = "pastebinit -b paste.debian.net";
      sudo = "sudo -E";

      # Git commands.
      git = "hub";
      gpush = "git push -u origin \`git rev-parse --abbrev-ref HEAD\`";
      "g.." = "cd \`git root\`";

      # Text editors.
      e = "emacsclient -n";
      em = "emacsclient -nw";
      vi = "em";

      # NixOS.
      all = "upgrade && collect && optimize";
      collect = "sudo nix-collect-garbage -d";
      optimize = "sudo nix-store --optimise";
      switch = "sudo nixos-rebuild switch";
      upgrade = "switch --upgrade";
    };

    variables = rec {
      EDITOR = "${pkgs.neovim}/bin/nvim";
      ALTERNATE_EDITOR = EDITOR;
      FZF_DEFAULT_OPTS = "--exact";
      PRUNEPATHS = builtins.concatStringsSep " " [
        "/nix/store"
        "/run/user"
      ];
      npm_config_prefix = "~/.node_modules";
    };

    extraInit = ''
      export GEM_HOME="$HOME/.gem/ruby/2.4.0"
      export PATH="$HOME/.node_modules/bin:$GEM_HOME/bin:$PATH"
    '';
  };

  hardware = {
    cpu = {
      intel = {
        updateMicrocode = true;
      };
    };

    enableAllFirmware = true;

    undervolt = {
      enable = true;
      temp = 90;
      core = -120;
      cache = -120;
      gpu = -100;
      uncore = -100;
      analogio = -100;
    };
  };

  i18n = {
    consoleFont = "latarcyrheb-sun32";
  };

  networking = rec {
    hostName = "manhattan";

    # Needed until https://github.com/NixOS/nixpkgs/pull/36261 is merged.
    extraHosts = ''
      127.0.1.1 ${hostName}.localdomain ${hostName}
    '';
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      customPaneNavigationAndResize = true;
      escapeTime = 75;
      historyLimit = 100000;
      keyMode = "vi";
      newSession = true;
      shortcut = "Space";
      terminal = "tmux-256color";
      extraTmuxConf = ''
        # Mouse support.
        set -g mouse on

        # Status bar.
        set -g status-position top
        set -g status-bg '#444444'
        set -g status-fg '#ffffff'
        set -g status-left ' #(date +"%H:%M")'
        set -g status-right '#(date +"%H:%M") '
        set -g status-justify centre

        # Window title.
        set -g window-status-format '[#I #W]'
        set -g window-status-current-format '[#I #W]'
        set -g window-status-current-bg 'green'
        set -g window-status-current-fg 'black'
        set -g window-status-bell-bg 'green'
        set -g window-status-bell-fg '#444444'

        # Pane borders.
        set -g pane-active-border-fg '#ffffff'
        set -g pane-border-fg '#444444'

        # Key bindings.
        bind C-Space last-window
        bind x split-window -v -c '#{pane_current_path}'
        bind v split-window -h -c '#{pane_current_path}'

        # Vim key bindings in copy mode.
        bind -T copy-mode-vi Escape send -X cancel
        bind -T copy-mode-vi K      send -X page-up
        bind -T copy-mode-vi J      send -X page-down
        bind -T copy-mode-vi v      send -X begin-selection

        # Clipboard integration.
        bind -T copy-mode-vi y                 send -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
        bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xsel -i -p && xsel -o -p | xsel -i -b"
        bind -n M-v run "xsel -o -b | tmux load-buffer - ; tmux paste-buffer"
      '';
    };

    zsh = {
      enable = true;

      interactiveShellInit = ''
        source "${pkgs.grml-zsh-config}/etc/zsh/zshrc"
        source "${pkgs.autojump}/share/autojump/autojump.zsh"
        source "${pkgs.fzf}/share/fzf/completion.zsh"
        source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
        source virtualenvwrapper_lazy.sh

        # Automatically activate virtualenvs.
        precmd_functions=(auto_workon $precmd_functions)
        function auto_workon() {
            if [ "$PWD" != "$PY_OLDPWD" ] && [ -f .venv ]; then
                workon `cat .venv`
                PY_OLDPWD="$PWD"
            fi
        }

        # Custom grml ZSH prompt.
        function virtual_env_prompt () { REPLY=''${VIRTUAL_ENV+ (''${VIRTUAL_ENV:t})} }
        grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
        zstyle ':prompt:grml:right:setup' items sad-smiley virtual-env
        zstyle ':prompt:grml:left:setup' items rc path vcs percent

        # Automatically source local .envrc files.
        eval "$(direnv hook zsh)"

        # Launch tmux when opening a terminal (not inside Emacs).
        test $TERM != "eterm-color" && test -z "$TMUX" && tmux attach
      '';

      promptInit = "";

      syntaxHighlighting = {
        enable = true;
      };
    };
  };

  sound = {
    enable = true;
  };

  services = {
    fstrim = {
      enable = true;
    };

    postgresql = {
      enable = true;
      initialScript = pkgs.writeText "users-initialScript" ''
        CREATE ROLE andrea WITH LOGIN PASSWORD password CREATEDB;
        CREATE DATABASE andrea;
        GRANT ALL PRIVILEGES ON DATABASE andrea TO andrea;
      '';
      package = pkgs.postgresql100;
    };

    rabbitmq = {
      enable = true;
    };

    redis = {
      enable = true;
    };

    tlp = {
      enable = true;
    };

    xserver = {
      enable = true;

      autoRepeatDelay = 200;
      autoRepeatInterval = 60;

      desktopManager = {
        gnome3 = {
          enable = true;
        };
      };

      # Will not be needed anymore soon (included by Gnome3).
      displayManager = {
        gdm = {
          enable = true;
        };
      };

      libinput = {
        disableWhileTyping = true;
        naturalScrolling = true;
      };

      xkbOptions = "ctrl:nocaps";
    };
  };

  time = {
    timeZone = "Europe/London";
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      andrea = {
        extraGroups = [ "wheel" "networkmanager" ];
        home = "/home/andrea";
        isNormalUser = true;
        initialPassword = "password";
        uid = 1000;
      };
    };
  };

  system = {
    stateVersion = "18.03";
  };
}
