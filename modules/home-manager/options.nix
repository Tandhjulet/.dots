{ lib, ... }:

{
  options.my.desktop = {
    waybarKind = lib.mkOption {
      type = lib.types.enum [ "mecha" ];
      default = "mecha";
      description = "Waybar kind";
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