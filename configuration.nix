{ lib, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./modules/hardware/nvidia.nix
      ./modules/hardware/audio.nix

      ./modules/system/networking.nix
      ./modules/system/locale.nix
      ./modules/system/packages.nix

      <home-manager/nixos>
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

  # Desktop / Window Manager
  config = lib.mkIf (config.specialisation == {}) (import ./modules/wm/gnome.nix);

  # User / Home Manager
  users.users."nix" = {
    isNormalUser = true;
    description = "mads";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users."nix" = {
    imports = [ ./home.nix ];
  };
  
  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
