{ config, pkgs, ... }:

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # User / Home Manager
  users.users."nix" = {
    isNormalUser = true;
    description = "mads";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  home-manager.users."nix" = {
    imports = [ ./home.nix ];
  };
  
  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
