{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ../../home/common.nix
    ../../modules/desktop/common/options.nix
  ];

  # Monitor configuration
  my.monitors = [
    { name = "DP-2"; width = 1920; height = 1080; refresh = 60.0; x = 0; y = 0; scale = 1.0; primary = true; }
    { name = "DP-3"; width = 1920; height = 1080; refresh = 60.0; x = -1920; y = 0; scale = 1.0; }
  ];

  programs.git.settings.user = {
    name = "Mads";
    email = "madsbechmortensen@hotmail.dk";
  };

  home.stateVersion = stateVersion;
}