{
  mainBar = {
    layer = "top";
    position = "top";
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;

    spacing = 0;
    tooltip = true;
    reload_style_on_change = true;

    modules-left = [ "mpris" ];
    modules-center = [
      "clock"
      "custom/menu"
      "niri/workspaces"
      # hyprland/workspaces
      # mango/workspaces
      "custom/recorder"
      "group/monitor"
      "group/bar"
    ];
    modules-right = [
      "backlight"
      "backlight/slider"
      "pulseaudio"
      "pulseaudio/slider"
      "custom/notification"
    ];

    "niri/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
      };
    };
  };
}