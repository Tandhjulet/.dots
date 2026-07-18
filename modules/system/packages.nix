{ config, pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.git = {
    enable = true;

    config.user = {
      name = "Mads";
      email = "madsbechmortensen@hotmail.dk";
    };
  };
}