{ pkgs, ... }:

{
  imports = [
    ./modules/daemons.nix
    ./modules/keybindings.nix
    ./modules/modes.nix
    #./modules/rules
    ./modules/theme.nix
  ];
  wayland.windowManager.sway = {
    checkConfig = false;
    enable = true;
    #xwayland = false;
    config = {
      defaultWorkspace = "workspace number 1";
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
        inner = 4;
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
          bg = "~/.config/sway/wp.png fill";
          scale = "1";
        };
        "HDMI-A-1" = {
          resolution = "2440x1440";
          bg = "~/.config/sway/wp.png fill";
          scale = "1";
        };
      };
      bars = [
        {
          colors = {
            focusedWorkspace = {
              background = "#fe8019";
              border = "#fe8019";
              text = "#282828";
            };
            inactiveWorkspace = {
              background = "#3c3836";
              border = "#3c3836";
              text = "#ebdbb2";
            };
            urgentWorkspace = {
              background = "#b16286";
              border = "#b16286";
              text = "#282828";
            };
          };
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          position = "top";
          trayOutput = "none";
          fonts = {
            names = [ "JetBrainsMonoNLNerdFontMono" ];
            style = "Regular";
            size = 11.0;
          };
        }
        #{
        #  statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
        #  position = "bottom";
        #  trayOutput = "none";
        #  fonts = {
        #    names = [ "JetBrainsMonoNLNerdFontMono" ];
        #    style = "Regular";
        #    size = 11.0;
        #  };
        #  workspaceButtons = false;
        #}
      ];
    };
  };
}
