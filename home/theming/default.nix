{ pkgs, inputs, config, ... }:

{
  imports = [
    ./matugen.nix
  ];

  home.packages = with pkgs; [
    # inputs.matugen.packages.${stdenv.hostPlatform.system}.default
    (pkgs.writeShellScriptBin "set-wallpaper" ''
      set -e
      WALLPAPER="$1"
      matugen image "$WALLPAPER"
      swaybg -i "$WALLPAPER" &
    '')
  ];

  programs.matugen = {
    enable = true;

    settings = {
      templates = {
        waybar = {
          input_path = ./templates/colors.css;
          output_path = "$HOME/waybar/colors.css";
          post_hook = "pkill -SIGUSR2 waybar";
        };

        rofi = {
          input_path = ./templates/rofi-colors.rasi;
          output_path = "$HOME/rofi/colors.rasi";
        };

        swaync = {
          input_path = ./templates/colors.css;
          output_path = "$HOME/swaync/colors.css";
          post_hook = "swaync-client -rs";
        };
      };
    };
  };
}