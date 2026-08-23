{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.programs.spicetify;
  theme = import (./. + "/${cfg.theme}") { inherit pkgs; };
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      theme = theme;
    };
  };
}
