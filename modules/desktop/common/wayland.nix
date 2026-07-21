{ config, pkgs, ... }:

let
  pos = config.my.desktop.barPosition;
in 
{
  # imports = [
  #   /waybar/${pos}.nix
  # ];

  # Core
  programs.waybar = {
    enable = true;
    style = ./waybar/${pos}/style.css;
    settings = import ./waybar/${pos}/config.nix;
  };

  # TODO: wallpaper
  programs.fastfetch.enable = true;
  programs.rofi.enable = true; # App launcher + dmenu replacement
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