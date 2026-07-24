{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;

    settings = builtins.fromJSON (builtins.readFile ./config.json);
    style = ./style.css;
  };

  xdg.configFile."swaync/styles" = {
    source = ./styles;
    recursive = true;
  };
}