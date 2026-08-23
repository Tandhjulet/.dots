{ lib, ... }:

{
  options.my.wm = lib.mkOption {
    type = lib.types.enum [ "niri" ];
    default = "niri";
    description = "Window manager / compositor to use.";
  };

  options.my.boot.plymouth = {
    enable = lib.mkOption { type = lib.types.bool; default = true; description = "Enable the Plymouth boot splash."; };
    theme = lib.mkOption {
      type = lib.types.enum [ "bgrt" "catppuccin-mocha" "catppuccin-macchiato" "catppuccin-frappe" "catppuccin-latte" "cuts_alt" ];
      default = "cuts_alt";
      description = "Plymouth theme to use.";
    };
  };
}
