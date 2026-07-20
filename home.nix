{ config, pkgs, ... }:

{
  imports = [
    ./modules/desktop/common/options.nix
  ];

  # Monitor configuration
  my.monitors = [
    { name = "DP-2"; width = 1920; height = 1080; refresh = 60.0; x = 0; y = 0; scale = 1.0; primary = true; }
    { name = "DP-3"; width = 1920; height = 1080; refresh = 60.0; x = -1920; y = 0; scale = 1.0; }
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

    settings.user = {
      name = "Mads";
      email = "madsbechmortensen@hotmail.dk";
    };
  };

  home.stateVersion = "26.05";
}