{ pkgs, inputs, config, ... }:

let
  wallpaperStateFile = "${config.xdg.stateHome}/wallpaper/current";
in
{
  imports = [
    ./matugen.nix
  ];

  home.packages = with pkgs; [
    awww

    (pkgs.writeShellScriptBin "set-wallpaper" ''
      set -e
      WALLPAPER="$(readlink -f "$1")"
      mkdir -p "$(dirname "${wallpaperStateFile}")"
      matugen image "$WALLPAPER"
      ln -sf "$WALLPAPER" "${wallpaperStateFile}"
    '')

    (pkgs.writeShellScriptBin "wallpaper-restore" ''
      set -e
      [ -e "${wallpaperStateFile}" ] || exit 0
      for _ in $(seq 1 40); do
        awww query >/dev/null 2>&1 && break
        sleep 0.25
      done
      matugen image "$(readlink -f "${wallpaperStateFile}")"
    '')
  ];

  programs.matugen = {
    enable = true;

    settings = {
      config = {
        version_check = false;

        wallpaper = {
          set = true;
          command = "awww img --transition-type center {{ image }}";
        };
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
