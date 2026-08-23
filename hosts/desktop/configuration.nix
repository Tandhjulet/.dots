{ lib, config, pkgs, username, stateVersion, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/nixos/options.nix

      ../../modules/nixos/hardware/nvidia.nix
      ../../modules/nixos/hardware/audio.nix

      ../../modules/nixos/system/fonts.nix
      ../../modules/nixos/system/networking.nix
      ../../modules/nixos/system/locale.nix
      ../../modules/nixos/system/packages.nix

      ../../modules/nixos/desktop/gnome.nix
      ../../modules/nixos/desktop/niri.nix

      ../../modules/nixos/boot/plymouth.nix
    ];

  my.wm = "niri";

  boot.loader.timeout = null;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.printing.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wireshark" "lp" "storage" "audio" "video" "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      curl
      icu
      libunwind
      glib
    ];
  };

  system.stateVersion = stateVersion;
}
