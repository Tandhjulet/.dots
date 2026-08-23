{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;

    settings = builtins.fromJSON (builtins.readFile ../../../programs/swaync/config.json);
    style = ../../../programs/swaync/style.css;
  };

  xdg.configFile."swaync/styles" = {
    source = ../../../programs/swaync/styles;
    recursive = true;
  };
}