{ config, lib, ... }:

{
  config = lib.mkIf (config.my.wm == "gnome") {
    services.desktopManager.gnome.enable = true;
  };
}
