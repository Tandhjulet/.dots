{ inputs, config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    spotify
    vscode

    ## Files, images, etc.
    jq # Command-line JSON
    imagemagick # Image processing (for Niri, backdrop blur)
    ffmpeg
    unrar
    unzip
    zip
    mpv # Movie Player (video)
    imv # LW images viewer
  ];
}