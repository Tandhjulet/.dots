{ config, pkgs, ... }:

let
  waybarKind = config.my.desktop.waybarKind;
in 
{
  programs.waybar = {
    enable = true;
    style = ./${waybarKind}/style.css;
    settings.mainBar = builtins.fromJSON (builtins.readFile ./${waybarKind}/config.json);
  };

  xdg.configFile."waybar/modules" = {
    source = ./${waybarKind}/modules;
    recursive = true;
  };

  xdg.configFile."waybar/styles" = {
    source = ./${waybarKind}/styles;
    recursive = true;
  };

  xdg.configFile."waybar/scripts" = {
    source = ./${waybarKind}/scripts;
    recursive = true;
  };
}