{ ... }:

{
  imports = [
    ../options.nix

    ../hardware/audio.nix

    ../system/fonts.nix
    ../system/networking.nix
    ../system/locale.nix
    ../system/packages.nix
    ../system/kernel.nix
    ../system/nix.nix
    ../system/nix-ld.nix
    ../system/users.nix

    ../desktop/common.nix
    ../desktop/display-manager.nix
    ../desktop/gnome.nix
    ../desktop/niri.nix
    ../desktop/hyprland.nix

    ../boot/plymouth.nix
    ../boot/silent.nix
  ];
}
