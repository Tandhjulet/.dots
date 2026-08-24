{ lib, config, pkgs, ... }:

let
  cfg = config.my.wms.niri;
  themeDir = ./. + "/${cfg.theme}";

  mkNiriOutput = m: ''
    output "${m.name}" {
        mode "${toString m.width}x${toString m.height}@${toString m.refresh}"
        position x=${toString m.x} y=${toString m.y}
        scale ${toString m.scale}
    }
  '';
  niriOutputs = lib.concatStrings (map mkNiriOutput config.my.monitors);
in
{
  imports = [
    ../../wayland.nix
    ../../options.nix

    ../../programs/waybar/mod.nix
    ../../programs/rofi/mod.nix
    ../../programs/swaync/mod.nix
  ];

  home.packages = cfg.packages ++ [ pkgs.xwayland-satellite ];

  xdg.configFile."niri/outputs.kdl".text = niriOutputs;
  xdg.configFile."niri" = {
    source = themeDir + "/config";
    recursive = true;
  };
}
