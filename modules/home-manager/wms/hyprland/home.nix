{ config, pkgs, ... }:

{
  imports = [
    ../../wayland.nix
    ../../options.nix

    ./flavors/caelestia/home.nix
    ./flavors/serpantinum/home.nix
  ];

  home.packages = config.my.wms.hyprland.packages;
}
