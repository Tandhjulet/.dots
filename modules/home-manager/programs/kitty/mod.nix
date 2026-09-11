{ config, lib, ... }:

let
  cfg = config.my.programs.kitty;
in
{
  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      themeFile = cfg.theme;

      font = {
        name = "CommitMono Nerd Font";
        size = 11;
      };

      settings = {
        confirm_os_window_close = 0;
        scrollback_lines = 10000;
        cursor_shape = "beam";
        window_padding_width = 8;
      };
    };
  };
}
