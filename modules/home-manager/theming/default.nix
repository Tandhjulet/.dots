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
      config = {
        version_check = false;

        # wallpaper = {
        #   set = true;
        #   command = "awww img --transition-type center {{ image }}";
        # };
      };

      templates = {
        waybar = {
          input_path = ../../../programs/theming/templates/colors.css;
          output_path = "${config.xdg.configHome}/waybar/colors.css";
          post_hook = "pkill -SIGUSR2 waybar || :";
        };

        rofi = {
          input_path = ../../../programs/theming/templates/rofi-colors.rasi;
          output_path = "${config.xdg.configHome}/rofi/colors.rasi";
        };

        swaync = {
          input_path = ../../../programs/theming/templates/colors.css;
          output_path = "${config.xdg.configHome}/swaync/colors.css";
          post_hook = "swaync-client -rs";
        };
      };
    };
  };
}