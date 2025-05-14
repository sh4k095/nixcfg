{ pkgs, ... }:

{
  imports = [
    #./modules/daemons
    ./modules/keybindings
    #./modules/modes
    #./modules/rules
    #./modules/theme
  ];
  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    config = {
      modifier = "Mod4";
      floating = {
        modifier = "Mod4";
        border = 0;
      };
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      window = {
        border = 0;
        titlebar = false;
      };
      gaps = {
        inner = 2;
        outer = 2;
        smartBorders = "on";
        smartGaps = true;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          xkb_options = "caps:escape";
        };
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
      };
      output = {
        "eDP-1" = {
          resolution = "2560x1600";
          scale = "1";
        };
        "HDMI-A-1" = {
          resolution = "2440x1440";
          scale = "1";
        };
      };
      bars = [{
        position = "top";
        command = "${pkgs.waybar}/bin/waybar";
      }];
    };
  };
}
