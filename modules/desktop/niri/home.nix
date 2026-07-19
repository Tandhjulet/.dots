{ config, pkgs, ... }:

{
  programs.waybar.enable = true;

  programs.swaylock.enable = true; # screen locker
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true;
  
  home.packages = with pkgs; [
    swaybg
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}