{ config, lib, pkgs, username, ... }:

{
  config = lib.mkIf (config.my.wm == "hyprland") {
    programs.hyprland.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users."${username}".imports = [ ../../home-manager/wms/hyprland/home.nix ];
  };
}
