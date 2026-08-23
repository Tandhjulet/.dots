{ config, lib, pkgs, ... }:

let
  cfg = config.my.boot.plymouth;
  catppuccinVariant = lib.removePrefix "catppuccin-" cfg.theme;
in
{
  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      theme = cfg.theme;
      themePackages = lib.optional (lib.hasPrefix "catppuccin-" cfg.theme) (
        pkgs.catppuccin-plymouth.override { variant = catppuccinVariant; }
      );
    };

    boot.kernelParams = [ "quiet" "loglevel=3" ];
    boot.consoleLogLevel = 3;
    boot.initrd.verbose = false;
  };
}
