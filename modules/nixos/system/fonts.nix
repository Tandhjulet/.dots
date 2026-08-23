{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji

    nerd-fonts.commit-mono
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Inter" ];
    monospace = [ "JetBrains Mono" ];
    emoji = [ "Noto Color Emoji" ];
  };
}