{ config, pkgs, ... }:

{
  imports = [
    ./theming/default.nix
  ];

  home.packages = with pkgs; [
    alacritty
  ];

  services.polkit-gnome.enable = true;

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;
  };
}