{ config, pkgs, ... }:

{
  imports = [
    ./theming/default.nix
  ];

  home.packages = with pkgs; [
    alacritty
    brightnessctl
    fzf
  ];

  services.polkit-gnome.enable = true;
  services.mpris-proxy.enable = true;

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;
  };
}