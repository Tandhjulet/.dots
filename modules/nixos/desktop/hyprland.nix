{ config, lib, pkgs, username, inputs, ... }:

{
  imports = [ inputs.serpantinum.nixosModules.default ];

  config = lib.mkIf (config.my.wm == "hyprland") {
    programs.hyprland.enable = true;
    programs.serpantinum.enable = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    home-manager.users."${username}".imports = [ ../../home-manager/wms/hyprland/home.nix ];
  };
}
