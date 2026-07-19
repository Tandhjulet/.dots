{ config, pkgs, ... }:

{
  programs.waybar.enable = true;

  home.packages = with pkgs; [ swaylock mako swayidle ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}