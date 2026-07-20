{ lib, config, pkgs, username, stateVersion, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/audio.nix

      ../../modules/system/fonts.nix
      ../../modules/system/networking.nix
      ../../modules/system/locale.nix
      ../../modules/system/packages.nix

      ../../modules/desktop/gnome.nix
      ../../modules/desktop/niri/mod.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = null;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = stateVersion;
}
