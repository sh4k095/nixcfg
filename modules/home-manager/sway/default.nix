{ pkgs, ... }:

{
  imports = [
    ./modules/daemons.nix
    ./modules/keybindings.nix
    ./modules/modes.nix
    ./modules/rules.nix
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
        #commands = [
        #  {
        #    command = ''
        #      {
        #        floating enable
        #        resize set 100ppt 40ppt
        #        move position 0 0
        #        move to scratchpad
        #        scratchpad show
        #      }
        #      '';
        #    criteria = {
        #      app_id = "dropdown-terminal";
        #    };
        #  }
        #];
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
          bg = "~/.config/sway/wp.png fill";
          scale = "1";
        };
        "eDP-2" = {
          resolution = "2560x1600";
          bg = "~/.config/sway/wp.png fill";
          scale = "1";
        };
        "HDMI-A-1" = {
          resolution = "3440x1440";
          bg = "~/.config/sway/wp.png fill";
          scale = "1";
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
