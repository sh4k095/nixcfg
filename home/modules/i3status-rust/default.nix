{ config, lib, pkgs, ... }:

{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "emoji";
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {
              separator = "";
            };
          };
        };
        blocks = [
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          {
            block = "backlight";
            format = "$icon $brightness";
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
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
            block = "sound";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
      };
      bottom = {
        icons = "emoji";
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {
              icons = "emoji";
              separator = "";
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
