{ 
  flake.modules.homeManager.sway = { pkgs, ... }: {
    wayland.windowManager.sway = {
      checkConfig = false;
      enable = true;
      xwayland = true; # required for mattermost-desktop
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
          outer = 1;
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
            #bg = "~/.config/sway/wp.png fill";
            scale = "1";
            position = "3440 0";
          };
          "eDP-2" = {
            resolution = "2560x1600";
            #bg = "~/.config/sway/wp.png fill";
            scale = "1";
            position = "3440 0";
          };
          "HDMI-A-1" = {
            resolution = "3440x1440";
            #bg = "~/.config/sway/wp.png fill";
            scale = "1";
            position = "0 0";
          };
        };
        bars = [
          {
            colors = {
              focusedWorkspace = {
                background = "#d65d0e";
                border = "#d65d0e";
                text = "#282828";
              };
              inactiveWorkspace = {
                background = "#282828";
                border = "#282828";
                text = "#ebdbb2";
              };
              urgentWorkspace = {
                background = "#458588";
                border = "#458588";
                text = "#282828";
              };
            };
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            position = "top";
            #trayOutput = "none";
            fonts = {
              names = [ "JetBrainsMonoNLNerdFontMono" ];
              style = "Regular";
              size = 11.0;
            };
          #  workspaceButtons = false;
          }
        ];
      };
    };
  };
}
