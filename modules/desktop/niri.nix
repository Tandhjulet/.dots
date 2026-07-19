{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;

  security.polkit.enable = true;
  services.gnome.gnome-keying.enable = true;
  security.pam.services.swaylock = {};

  programs.waybar.enable = true;
  environment.systemPackages = with pkgs; [ swaylock mako swayidle ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}