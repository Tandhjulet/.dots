{ config, pkgs, ... }:

{
  programs.fastfetch.enable = true;
  programs.swaylock.enable = true;

  services.swayidle.enable = true;

  home.packages = with pkgs; [
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
      xdg-desktop-portal-hyprland
      xdg-desktop-portal
    ];
    config.common.default = "";
  };
}
