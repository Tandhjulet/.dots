{ config, lib, pkgs, ... }:

let
  cfg = config.my.boot.plymouth;

  themePackages =
    if lib.hasPrefix "catppuccin-" cfg.theme then
      [ (pkgs.catppuccin-plymouth.override { variant = lib.removePrefix "catppuccin-" cfg.theme; }) ]
    else if cfg.theme == "bgrt" then
      [ ]
    else
      [ (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ cfg.theme ]; }) ];
in
{
  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      theme = cfg.theme;
      inherit themePackages;
    };
  };
}
