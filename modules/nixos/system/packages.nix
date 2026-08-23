{ inputs, config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    vscode

    brightnessctl
    libnotify

    jq
    imagemagick
    ffmpeg
    unrar
    unzip
    zip
    mpv
    imv
  ];
}
