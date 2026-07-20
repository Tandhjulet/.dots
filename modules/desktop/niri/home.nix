{ config, pkgs, ... }:

{
  imports = [ ../common/wayland.nix ];

  home.packages = with pkgs; [
    alacritty
    fuzzel
  ];

  xdg.configFile."niri" = {
    source = ./config;
    recursive = true;
  };
}