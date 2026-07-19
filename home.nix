{ config, pkgs, ... }:

{
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