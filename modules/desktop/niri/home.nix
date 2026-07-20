{ lib, config, pkgs, ... }:

let 
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
  imports = [ ../common/wayland.nix ../common/options.nix ];

  home.packages = with pkgs; [
    alacritty
    fuzzel
  ];

  xdg.configFile."niri/outputs.kdl".text = niriOutputs;
  xdg.configFile."niri" = {
    source = ./config;
    recursive = true;
  };
}