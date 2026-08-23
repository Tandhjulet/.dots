# My .dot files for NixOS

This is still a work-in-progress. More information will follow.

## Structure

- `hosts/<name>/` — per-machine entrypoints (`configuration.nix`, `home.nix`, hardware scan).
- `modules/nixos/` — system-level modules (hardware, core system settings, desktop environment enablement, `my.wm` selection).
- `modules/home-manager/` — user-level (home-manager) modules.
  - `programs/<name>/` — a toggleable, themeable desktop program (e.g. `waybar`, `rofi`, `swaync`): `mod.nix` wires it up, `<theme>/` folders hold the actual config/assets. Selected via `my.programs.<name>.{enable,theme}`.
  - `wms/<name>/` — a window manager's home-manager side (e.g. `niri`), same `<theme>/` folder convention. Selected via `my.wms.<name>`.

## TODO

- Waybar mecha (buttons)
- GTK styling
- Wallpaper searching, etc.
- Keybinds!
- Hyprland setup (ilyamiro's .dots wrapped, perhaps?)
- MangoWC setup
- DriftWM
- Better structure, handle the WMs and package themes (e.g. waybar "mecha"/whatever) with options (how should this work?)
- Declarative fan control (is this even possible?)

## CREDIT

- [Theaninova/TheaninovOS](https://github.com/Theaninova/TheaninovOS): Matugen setup and a great approach to handling multiple WMs/packages with options
- [sejjy/mechabar](https://github.com/sejjy/mechabar): Author of the "mechabar" waybar theme
- [hakuimaku/hakuspace](https://github.com/hakuimaku/hakuspace): Niri configuration
- [iyiolacak/iyiolacak-swaync-config](https://github.com/iyiolacak/iyiolacak-swaync-config): Inspired the minimalistic SwayNC config
- [Astromations/Hazy](https://github.com/Astromations/Hazy): The "Hazy" Spicetify theme
- [Gerg-L/spicetify-nix](https://github.com/Gerg-L/spicetify-nix): Home-manager module for Spicetify
