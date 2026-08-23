{ config, pkgs, ... }:

let
  waybarKind = config.my.desktop.waybarKind;
  themeDir = ../../../programs/waybar + "/${waybarKind}";
in
{
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
}