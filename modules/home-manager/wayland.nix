{ config, pkgs, ... }:

{
  imports = [
    ./programs/waybar/mod.nix
    ./programs/rofi/mod.nix
    ./programs/swaync/mod.nix
  ];

  programs.fastfetch.enable = true;
  programs.swaylock.enable = true;

  services.swayidle.enable = true;

  home.packages = with pkgs; [
    swaybg
    xwayland-satellite
    wl-clipboard
    cliphist
    grim
    slurp

    xdg-utils
    xhost
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal
    ];
    config.common.default = "";
  };
}
