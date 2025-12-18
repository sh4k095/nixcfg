{
  flake.modules.homeManager.waybar = { lib, pkgs, ... }: {
    home.packages = with pkgs; [
      wttrbar
    ];
    programs.waybar.settings.main = {
      "sway/workspaces" = {
        all-outputs = true;
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "0";
        };
        disable-scroll = true;
        numeric-first = true;
        disable-auto-back-and-forth = true;
      };
      "sway/scratchpad" = {
        format = "{icon} {count}";
        show-empty = false;
        format-icons = [
          ""
          "󱂬"
        ];
        tooltip = true;
        tooltip-format = "{app}: {title}";
      };
      "custom/launcher" = {
        format = "󱅥";
        on-click = lib.getExe pkgs.fuzzel;
        tooltip = false;
      };
      "cpu" = {
        interval = 1;
        format = " {usage:02}% {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{icon8}{icon9}{icon10}{icon11}{icon12}{icon13}{icon14}{icon15}";
        #format = "🫀 {usage:02}%";
        #max-length = 12;
        format-icons = [
          "<span color='#98971a'>▁</span>"
          "<span color='#98971a'>▂</span>"
          "<span color='#d79921'>▃</span>"
          "<span color='#d79921'>▄</span>"
          "<span color='#d65d0e'>▅</span>"
          "<span color='#d65d0e'>▆</span>"
          "<span color='#cc241d'>▇</span>"
          "<span color='#cc241d'>█</span>"
        ];
        states = {
          warning = 70;
          critical = 90;
        };
        on-click = "${lib.getExe pkgs.alacritty} --class=btop -e ${lib.getExe pkgs.btop}";
        tooltip = true;
      };
      "temperature" = {
        critical-threshold = 80;
        interval = 1;
        format-critical = "󰈸 {temperatureC}°C";
        #format-critical = "🔥 {temperatureC}°C";
        format = "{icon} {temperatureC}°C";
        #format = "🌡️ {temperatureC}°C";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        max-length = 12;
        tooltip = false;
      };
      "memory" = {
        interval = 1;
        format = " {used:0.2f} GiB";
        #format = "🧠 {used:0.2f} GiB";
        states = {
          warning = 70;
          critical = 90;
        };
        max-length = 12;
        tooltip = true;
        tooltip-format = "{used:0.2f} GiB/{total:0.2f} GiB used";
      };
      "disk#root" = {
        interval = 60;
        format = "󰋊 {percentage_used}%";
        #format = "💾 {percentage_used}%";
        max-length = 12;
        states = {
          warning = 70;
          critical = 90;
        };
        path = "/";
        tooltip = true;
        tooltip-format = "{used}/{total} used on {path} ({percentage_used}%)";
      };
      "clock" = {
        interval = 1;
        format = "{:%H:%M:%S %a, %b %d}";
        max-length = 24;
        tooltip = true;
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "left";
          format = {
            months = "<span color='#fe8019'><b>{}</b></span>";
            days = "<span color='#f9f5d7'>{}</span>";
            weeks = "<span color='#a89984'>W{}</span>";
            weekdays = "<span color='#a89984'>{}</span>";
            today = "<span color='#fe8019'><b>{}</b></span>";
          };
        };
        actions = {
          on-click = "mode";
        };
      };
      "custom/weather" = {
        format = "{}°";
        tooltip = true;
        interval = 3600;
        exec = "${lib.getExe pkgs.wttrbar} --location Vienna --nerd";
        return-type = "json";
        #max-length = 12;
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "󰈈";
          deactivated = "󰈉";
        };
      };
      backlight = {
        device = "intel_backlight";
        interval = 10;
        format = "{icon} {percent}%";
        format-icons = [
          "󱩏"
          "󱩐"
          "󱩐"
          "󱩒"
          "󱩓"
          "󱩔"
          "󱩕"
          "󱩖"
          "󰛨"
        ];
        max-length = 12;
        on-scroll-up = "${lib.getExe pkgs.brightnessctl} set 5%+";
        on-scroll-down = "${lib.getExe pkgs.brightnessctl} set 5%-";
        smooth-scrolling-threshold = 0.5;
      };
      "wireplumber#source" = {
        node-type = "Audio/Source";
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          default = "";
        };
        on-click = "${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        on-scroll-up = "${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SOURCE@ 5%+";
        on-scroll-down = "${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SOURCE@ 5%-";
        on-click-right = lib.getExe pkgs.pwvucontrol;
        smooth-scrolling-threshold = 0.5;
      };
      "wireplumber#sink" = {
        node-type = "Audio/Sink";
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-scroll-up = "${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        on-scroll-down = "${lib.getExe' pkgs.wireplumber "wpctl"} set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        on-click-right = lib.getExe pkgs.pwvucontrol;
        smooth-scrolling-threshold = 0.5;
      };

      "network#interface" = {
        interval = 30;
        format = "{icon} {ipaddr}";
        format-wifi = "{icon} ({signalStrength}%) {ipaddr}";
        format-icons = {
          wifi = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          ethernet = "󰈁";
          disconnected = "󰪎";
        };
        tooltip-format = "Via {gwaddr} ({netmask})";
        tooltip-format-disconnected = "Disconnected";
      };
      "network#band_down" = {
        interval = 1;
        format-wifi = " {bandwidthDownBytes}";
        format-ethernet = " {bandwidthDownBytes}";
        min-length = 10;
        max-length = 10;
        tooltip = false;
      };
      "network#band_up" = {
        interval = 1;
        format-wifi = " {bandwidthUpBytes}";
        format-ethernet = " {bandwidthUpBytes}";
        min-length = 10;
        max-length = 10;
        tooltip = false;
      };
      "battery" = {
        bat = "BAT0";
        interval = 30;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        format-charging = "󱐋 {capacity}%";
        format-plugged = " {capacity}%";
        max-length = 12;
      };
      tray = {
        icon-size = 21;
        spacing = 4;
      };
    };
  };
}
