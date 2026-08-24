{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.my.wms.hyprland;

  mkHyprMonitor = m: ''
    hl.monitor({
        output   = "${m.name}",
        mode     = "${toString m.width}x${toString m.height}@${toString m.refresh}",
        position = "${toString m.x}x${toString m.y}",
        scale    = ${toString m.scale},
    })
  '';
  hyprMonitors = lib.concatStrings (map mkHyprMonitor config.my.monitors);
in
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  config = lib.mkIf (cfg.flavor == "caelestia") {
    programs.caelestia = {
      enable = true;
      cli.enable = true;
      systemd.enable = false;
    };

    xdg.configFile."hypr" = {
      source = "${inputs.caelestia-dots}/hypr";
      recursive = true;
    };

    xdg.configFile."caelestia/hypr-user.lua".text = ''
      ${hyprMonitors}
      hl.on("hyprland.start", function()
          hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
          hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
      end)
    '';
  };
}
