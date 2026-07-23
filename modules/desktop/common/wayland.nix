{ config, pkgs, ... }:

{
  imports = [
    ./waybar/mod.nix
    ./rofi/mod.nix
  ];

  # TODO: wallpaper
  programs.fastfetch.enable = true;
  services.swaync.enable = true; # Notification daemon + notification center
  programs.swaylock.enable = true; # screen locker
  # let the terminal and shell be decided by the user

  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  
  home.packages = with pkgs; [
    swaybg
    xwayland-satellite
    wl-clipboard # Clipboard tools for wayland
    cliphist # Clipboard history
    grim # Screenshot
    slurp # Regional screenshots

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