{ lib, ... }:

{
  options.my.wm = lib.mkOption {
    type = lib.types.enum [ "niri" ];
    default = "niri";
    description = "Window manager / compositor to use.";
  };
}
