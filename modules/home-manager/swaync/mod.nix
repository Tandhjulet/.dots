{ config, lib, pkgs, ... }:

let
  cfg = config.my.programs.swaync;
  themeDir = ../../../programs/swaync + "/${cfg.theme}";
in
{
  config = lib.mkIf cfg.enable {
    services.swaync = {
      enable = true;

      settings = builtins.fromJSON (builtins.readFile (themeDir + "/config.json"));
      style = themeDir + "/style.css";
    };

    xdg.configFile."swaync/styles" = {
      source = themeDir + "/styles";
      recursive = true;
    };
  };
}
