{ pkgs, ... }:

{
  imports = [
    ./modules/daemons
    ./modules/keybindings
    ./modules/modes
    #./modules/rules
    ./modules/theme
  ];
  wayland.windowManager.sway = {
    enable = true;
    #xwayland = false;
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
      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          position = "top";
          trayOutput = "none";
          fonts = {
            names = [ "JetBrainsMonoNLNerdFontMono" ];
            style = "Regular";
            size = 11.0;
          };
        }
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          position = "bottom";
          trayOutput = "none";
          fonts = {
            names = [ "JetBrainsMonoNLNerdFontMono" ];
            style = "Regular";
            size = 11.0;
          };
          workspaceButtons = false;
        }
      ];
    };
  };
}
