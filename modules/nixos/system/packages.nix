{ inputs, config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    spotify
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
