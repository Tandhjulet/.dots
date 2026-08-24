{ config, lib, pkgs, username, ... }:

{
  config = lib.mkIf (config.my.wm == "niri") {
    programs.niri.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users."${username}".imports = [ ../../home-manager/wms/niri/home.nix ];
  };
}
