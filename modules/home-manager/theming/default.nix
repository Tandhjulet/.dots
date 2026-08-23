{ pkgs, inputs, config, ... }:

{
  imports = [
    ./matugen.nix
  ];

  home.packages = with pkgs; [
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
      config = {
        version_check = false;
      };

      templates = {
        waybar = {
          input_path = ./templates/colors.css;
          output_path = "${config.xdg.configHome}/waybar/colors.css";
          post_hook = "pkill -SIGUSR2 waybar || :";
        };

        rofi = {
          input_path = ./templates/rofi-colors.rasi;
          output_path = "${config.xdg.configHome}/rofi/colors.rasi";
        };

        swaync = {
          input_path = ./templates/colors.css;
          output_path = "${config.xdg.configHome}/swaync/colors.css";
          post_hook = "swaync-client -rs";
        };
      };
    };
  };
}
