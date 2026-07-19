{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;

    settings.user = {
      name = "Mads";
      email = "madsbechmortensen@hotmail.dk";
    };
  };

  home.stateVersion = "26.05";
}