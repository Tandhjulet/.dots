{ lib, pkgs, ... }:

{
  options.my = {
    programs = {
      waybar = {
        enable = lib.mkOption { type = lib.types.bool; default = true; description = "Enable waybar."; };
        theme = lib.mkOption { type = lib.types.enum [ "mecha" ]; default = "mecha"; description = "Waybar theme to use."; };
      };

      rofi = {
        enable = lib.mkOption { type = lib.types.bool; default = true; description = "Enable rofi."; };
        theme = lib.mkOption { type = lib.types.enum [ "default" ]; default = "default"; description = "Rofi theme to use."; };
      };

      swaync = {
        enable = lib.mkOption { type = lib.types.bool; default = true; description = "Enable SwayNC (notification daemon)."; };
        theme = lib.mkOption { type = lib.types.enum [ "default" ]; default = "default"; description = "SwayNC theme to use."; };
      };

      spicetify = {
        enable = lib.mkOption { type = lib.types.bool; default = true; description = "Enable Spicetify (themed Spotify)."; };
        theme = lib.mkOption { type = lib.types.enum [ "hazy" "dribbblish" "text" ]; default = "hazy"; description = "Spicetify theme to use."; };
        marketplace = lib.mkOption { type = lib.types.bool; default = false; description = "Install the Spicetify Marketplace custom app."; };
        extensions = lib.mkOption {
          type = lib.types.listOf (lib.types.enum [
            "playingSource"
            "lastfm"
            "adblock"
            "hidePodcasts"
            "betterGenres"
            "history"
            "shuffle"
            "trashbin"
          ]);
          default = [
            "playingSource"
            "lastfm"
            "adblock"
            "hidePodcasts"
            "betterGenres"
            "history"
            "shuffle"
          ];
          description = "Spicetify extensions to enable.";
        };
      };
    };

    wms = {
      niri = {
        theme = lib.mkOption { type = lib.types.enum [ "default" ]; default = "default"; description = "Niri config theme to use."; };
        packages = lib.mkOption {
          type = lib.types.listOf lib.types.package;
          default = with pkgs; [ alacritty fuzzel ];
          description = "Packages to install alongside niri (terminal, launcher, etc.).";
        };
      };

      hyprland = {
        flavor = lib.mkOption { type = lib.types.enum [ "caelestia" ]; default = "caelestia"; description = "Hyprland flavor/shell to use."; };
        packages = lib.mkOption {
          type = lib.types.listOf lib.types.package;
          default = with pkgs; [
            foot
            xfce.thunar
            pwvucontrol

            libnotify
            swappy
            dart-sass
            gpu-screen-recorder
            fuzzel
            gammastep
            trash-cli
            bluez
          ];
          description = "Packages to install alongside Hyprland (terminal, launcher, etc.).";
        };
      };
    };

    monitors = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          name = lib.mkOption { type = lib.types.str; };
          width = lib.mkOption { type = lib.types.int; };
          height = lib.mkOption { type = lib.types.int; };
          refresh = lib.mkOption { type = lib.types.float; };
          x = lib.mkOption { type = lib.types.int; };
          y = lib.mkOption { type = lib.types.int; };
          scale = lib.mkOption { type = lib.types.float; default = 1.0; };
          primary = lib.mkOption { type = lib.types.bool; default = false; };
        };
      });
      default = [ ];
      description = "Monitor topology";
    };
  };
}
