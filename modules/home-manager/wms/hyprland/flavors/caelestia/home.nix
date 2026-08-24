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

  toLuaValue = v:
    if builtins.isString v then builtins.toJSON v
    else if builtins.isBool v then (if v then "true" else "false")
    else if builtins.isInt v || builtins.isFloat v then toString v
    else if builtins.isList v then "{ ${lib.concatMapStringsSep ", " toLuaValue v} }"
    else throw "my.wms.hyprland.vars: unsupported value type";

  hyprVars = ''
    return {
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "    ${k} = ${toLuaValue v},") cfg.vars)}
    }
  '';

  shellSettingsFile = (pkgs.formats.json { }).generate "caelestia-shell-initial.json" config.programs.caelestia.settings;
in
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  config = lib.mkIf (cfg.flavor == "caelestia") {
    programs.caelestia = {
      enable = true;
      cli.enable = true;
      systemd.enable = false;

      cli.settings.wallpaper.postHook = ''awww img "$WALLPAPER_PATH" --transition-type center'';
    };

    # shell.json is left as a real, writable file (seeded once below) rather than
    # an immutable home-manager symlink, since caelestia persists its own runtime
    # state (scheme choice, etc.) back into it and can't write to a store symlink.
    xdg.configFile."caelestia/shell.json".enable = lib.mkForce false;

    home.activation.caelestiaShellConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      target="$HOME/.config/caelestia/shell.json"
      if [ ! -e "$target" ]; then
        run mkdir -p "$(dirname "$target")"
        run install -m 644 "${shellSettingsFile}" "$target"
      fi
    '';

    xdg.configFile."hypr" = {
      source = "${inputs.caelestia-dots}/hypr";
      recursive = true;
    };

    xdg.configFile."caelestia/hypr-vars.lua".text = hyprVars;

    xdg.configFile."caelestia/hypr-user.lua".text = ''
      ${hyprMonitors}
      hl.config({
          input = {
              kb_layout  = "${cfg.keyboard.layout}",
              kb_variant = "${cfg.keyboard.variant}",
          },
      })

      hl.on("hyprland.start", function()
          hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
          hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
      end)
    '';
  };
}
