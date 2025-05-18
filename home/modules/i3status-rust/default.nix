{ config, lib, pkgs, ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "material-nf";
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {
              idle_bg = "#282828";
              idle_fg = "#FE8019";
              good_bg = "#282828";
              good_fg = "#98971A";
              warning_bg = "#282828";
              warning_fg = "#D79921";
              critical_bg = "#282828";
              critical_fg = "#CC241D";
              info_bg = "#282828";
              info_fg = "#458588";
              alternating_ting_bg = "#282828";
              alternating_ting_fg = "#FE8019";
              separator_bg = "#282828";
              separator_fg = "#FE8019";
              separator = "|";
              end_separator = "|";
            };
          };
        };
        blocks = [
          {
            block = "scratchpad";
            format = " $icon $count ";
          }
          {
            block = "kdeconnect";
            format = " $icon $name ($bat_icon $bat_charge) ";
          }
          {
            block = "bluetooth";
            mac = "70:08:10:B1:E7:FB";
            format = " $icon ";
          }
          {
            block = "sound";
            format = " $icon $volume ";
            headphones_indicator = true;
          }
          {
            block = "backlight";
            format = " $icon $brightness ";
          }
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ($mem_used/$mem_total) ";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          {
            block = "battery";
            format = " $icon $percentage ($time_remaining) $power ";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
      };
      bottom = {
        icons = "material-nf";
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {
              idle_bg = "#282828";
              idle_fg = "#EBDBB2";
              good_bg = "#282828";
              good_fg = "#EBDBB2";
              warning_bg = "#282828";
              warning_fg = "#EBDBB2";
              critical_bg = "#282828";
              critical_fg = "#EBDBB2";
              info_bg = "#282828";
              info_fg = "#EBDBB2";
              alternating_ting_bg = "#282828";
              alternating_ting_fg = "#EBDBB2";
              separator_bg = "#282828";
              separator_fg = "#EBDBB2";
              separator = "|";
              end_separator = "|";
            };
          };
        };
        blocks = [
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "amd_gpu";
            format = "$icon $utilization ($vram_used/$vram_total)";
          }
          {
            block = "nvidia_gpu";
            format = "$icon $utilization $temperature";
          }
        #  {
        #    block = "memory";
        #    format_mem = "$icon $mem_used_percents";
        #    format_swap = "$icon $swap_used_percents";
        #  }
        #  {
        #    block = "cpu";
        #    interval = 1;
        #  }
        #  {
        #    block = "load";
        #    interval = 1;
        #    format = " $icon $1m ";
        #  }
        #  { block = "sound"; }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
      };
    };
  };
}
