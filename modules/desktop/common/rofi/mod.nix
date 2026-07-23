{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    terminal = "alacritty"; # TODO
    location = "center";
    modes = [
      "drun"
      "run"
      "window"
    ];

    extraConfig = {
      show-icons = true;
      drun-display-format = "{icon} {format}";
      disable-history = false;
      display-drun = " 󰍜 Apps ";
      display-run = "   Run ";
      display-window = "   Window ";

      sidebar-mode = true;
      window-format = "{w} | {c} | {t}";

      cycle = false;
    };

    theme = ./theme.rasi;
  };
}