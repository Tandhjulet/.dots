{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  security.pam.services.swaylock = {};

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager.users."nix".imports = [ ./home.nix ];
}