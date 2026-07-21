{ pkgs, inputs, config, ... }:

{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = true;
    variant = "dark";

    templates = {
      waybar = {
        input_path = ./templates/colors.css;
        output_path = "${config.xdg.configHome}/waybar/colors.css";
        hook = "pkill -SIGUSR2 waybar";
      };
    };
  };

  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "set-wallpaper" ''
      set -e
      WALLPAPER="$1"
      matugen image "$WALLPAPER"
      swaybg -i "$WALLPAPER" &
    '')
  ]
}