{config, lib, pkgs, ...}:

with lib;

let
  package = pkgs.pythonPackages.buildPythonApplication rec {
    pname = "undervolt";
    version = "0.2.9";
    name = "${pname}-${version}";
    doCheck = pkgs.pythonPackages.isPy3k;

    src = pkgs.pythonPackages.fetchPypi {
      inherit pname version;
      sha256 = "08nv5qraws35w95inbikgj9ydy5cw9s2xzvdh2b0y24hrkqwqm75";
    };
  };
  cfg = config.hardware.undervolt;
in {
    options.hardware.undervolt = {

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          When enabled, automatically apply undervolts on boot and after resume
        '';
      };

      bootDelay = mkOption {
        type = types.str;
        default = "1m";
        description = ''
          Timeout before start
        '';
      };

      interval = mkOption {
        type = types.int;
        default = 30;
        description = ''
          Interval between re-apply
        '';
      };

      temp = mkOption {
        type = types.int;
        default = null;
        description = ''
          Temperature when on AC
        '';
      };

      core = mkOption {
        type = types.int;
        default = null;
        description = ''
          CPU Core (0)
        '';
      };

      gpu = mkOption {
        type = types.int;
        default = null;
        description = ''
          Intel GPU (1)
        '';
      };

      cache = mkOption {
        type = types.int;
        default = null;
        description = ''
          CPU Core (2)
        '';
      };

      uncore = mkOption {
        type = types.int;
        default = null;
        description = ''
          CPU Core (3)
        '';
      };

      analogio = mkOption {
        type = types.int;
        default = null;
        description = ''
          Analog I/O
        '';
      };

      digitalio = mkOption {
        type = types.int;
        default = null;
        description = ''
          Digital I/O
        '';
      };
    };

    config = mkIf cfg.enable {
      environment.systemPackages = [package];
      boot.kernelModules = [ "msr" ];
      systemd.services.undervolt = {
        after = [ "suspend.target" "systemd-suspend.service" ];
        description = "Apply undervolts";
        script = ''
            ${package}/bin/undervolt -v \
              ${optionalString (cfg.temp != null) "--temp ${toString cfg.temp}"} \
              ${optionalString (cfg.core != null) "--core ${toString cfg.core}"} \
              ${optionalString (cfg.gpu != null) "--gpu ${toString cfg.gpu}"} \
              ${optionalString (cfg.cache != null) "--cache ${toString cfg.cache}"} \
              ${optionalString (cfg.uncore != null) "--uncore ${toString cfg.uncore}"} \
              ${optionalString (cfg.analogio != null) "--analogio ${toString cfg.analogio}"}
          '';
        serviceConfig.Type = "oneshot";
      };

      systemd.timers.undervolt = {
        description = "Run undervolt script";
        wantedBy = [ "multi-user.target" ];
        timerConfig = {
          Unit = "undervolt";
          OnBootSec = cfg.bootDelay;
          OnUnitActiveSec = cfg.interval;
        };
      };

    };
    meta = {};
  }
