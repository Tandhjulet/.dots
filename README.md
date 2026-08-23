# My .dot files for NixOS

This is still a work-in-progress. More information will follow.

## Structure

- `hosts/<name>/` — per-machine entrypoints (`configuration.nix`, `home.nix`, hardware scan).
- `modules/nixos/` — system-level modules (hardware, core system settings, desktop environment enablement).
- `modules/home-manager/` — user-level (home-manager) modules: the Nix glue that wires up programs and options.
- `programs/` — the actual program configs/assets (rofi theme, waybar theme, swaync styling, niri kdl config, matugen templates), referenced by the matching `modules/home-manager/` module.

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
