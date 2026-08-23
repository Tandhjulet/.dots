{ config, lib, pkgs, ... }:

let
  cfg = config.my.programs.waybar;
  themeDir = ../../../programs/waybar + "/${cfg.theme}";
in
{
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = themeDir + "/style.css";
      settings.mainBar = builtins.fromJSON (builtins.readFile (themeDir + "/config.json"));
    };

    xdg.configFile."waybar/modules" = {
      source = themeDir + "/modules";
      recursive = true;
    };

    xdg.configFile."waybar/styles" = {
      source = themeDir + "/styles";
      recursive = true;
    };

    xdg.configFile."waybar/scripts" = {
      source = themeDir + "/scripts";
      recursive = true;
    };
  };
}
