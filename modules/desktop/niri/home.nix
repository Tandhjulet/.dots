{ config, pkgs, ... }:

{
  imports = [ ../common/wayland.nix ];

  xdg.configFile."niri" = {
    source = ./config;
    recursive = true;
  };
}