{ lib, ... }:

{
  options.my.desktop = {
    barPosition = lib.mkOption {
      type = lib.types.enum [ "top" ];
      default = "top";
      description = "Where waybar/status bar should be anchored";
    };
  };

  options.my.monitors = lib.mkOption {
    type = lib.types.listOf (lib.types.submodule {
      options = {
        name = lib.mkOption { type = lib.types.str; };
        width = lib.mkOption { type = lib.types.int; };
        height = lib.mkOption { type = lib.types.int; };
        refresh = lib.mkOption { type = lib.types.float; };
        x = lib.mkOption { type = lib.types.int; };
        y = lib.mkOption { type = lib.types.int; };
        scale = lib.mkOption { type = lib.types.float; default = 1.0; };
        primary = lib.mkOption { type = lib.types.bool; default = false; };
      };
    });
    default = [ ];
    description = "Monitor topology";
  };
}