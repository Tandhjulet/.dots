{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ../../modules/home-manager/common.nix
    ../../modules/home-manager/options.nix
  ];

  my.monitors = [
    { name = "DP-2"; width = 1920; height = 1080; refresh = 60.0; x = 0; y = 0; scale = 1.0; primary = true; }
    { name = "DP-3"; width = 1920; height = 1080; refresh = 60.0; x = -1920; y = 0; scale = 1.0; }
  ];

  my.wms.hyprland.flavor = "caelestia";
  my.wms.hyprland.keyboard = { layout = "dk"; variant = "nodeadkeys"; };
  my.wms.hyprland.vars = {
    cursorTheme = "DMZ-White";
    cursorSize = 24;
    kbLauncher = "SUPER + R";
  };

  programs.caelestia.settings.paths.wallpaperDir = "~/Pictures/wallpapers/images";
  programs.caelestia.settings.general.logo = "caelestia";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "DMZ-White";
    package = pkgs.vanilla-dmz;
    size = 24;
  };

  # my.programs.spicetify.theme = "text";

  programs.git.settings.user = {
    name = "Mads";
    email = "madsbechmortensen@hotmail.dk";
  };

  home.stateVersion = stateVersion;
}