{ pkgs, inputs, config, ... }:

{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  home.packages = with pkgs; [
    inputs.matugen.packages.${stdenv.hostPlatform.system}.default
    (pkgs.writeShellScriptBin "set-wallpaper" ''
      set -e
      WALLPAPER="$1"
      matugen image "$WALLPAPER"
      swaybg -i "$WALLPAPER" &
    '')
  ];

  programs.matugen = {
    enable = true;
    jsonFormat = "hex";
    variant = "dark";

    templates = {
      waybar = {
        input_path = ./templates/colors.css;
        output_path = "~/.config/waybar/colors.css";
        post_hook = "pkill -SIGUSR2 waybar";
      };
    };
  };

  xdg.configFile."waybar/colors.css".source = "${config.programs.matugen.theme.files}/.config/waybar/colors.css";
}