{ lib, config, pkgs, username, stateVersion, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/nixos/hardware/nvidia.nix
      ../../modules/nixos/hardware/audio.nix

      ../../modules/nixos/system/fonts.nix
      ../../modules/nixos/system/networking.nix
      ../../modules/nixos/system/locale.nix
      ../../modules/nixos/system/packages.nix

      ../../modules/nixos/desktop/gnome.nix
      ../../modules/nixos/desktop/niri.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = null;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    # useOSProber = true;
    device = "nodev";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # User / Home Manager
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "wireshark" "lp" "storage" "audio" "video" "networkmanager" "wheel" ];
  };
  
  # Nix Settings
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
