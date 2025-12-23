{ 
  flake.modules.homeManager.sway = { pkgs, lib, config, ... }: {
    home.file = {
      ".config/sway/wp.png" = {
        source = ./wp.png;
        recursive = true;
      };
    };
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
          #"eDP-1" = {
          #  resolution = "2560x1600";
          #  bg = "~/.config/sway/wp.png fill";
          #  scale = "1";
          #  position = "3440 0";
          #};
          "eDP-2" = {
            resolution = "2560x1600";
            bg = "~/.config/sway/wp.png fill";
            scale = "1";
            position = "3440 0";
          };
          "HDMI-A-1" = {
            resolution = "3440x1440";
            bg = "~/.config/sway/wp.png fill";
            scale = "1";
            position = "0 0";
          };
        };
        bars = [
          { 
            command = lib.getExe config.programs.waybar.package; 
          }
        ];
      };
    };
  };
}
