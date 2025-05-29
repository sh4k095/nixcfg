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
              separator = "<span font='14.5'></span>";
            };
          };
        };
        blocks = [
          {
            block = "scratchpad";
            format = " $icon $count ";
            icons_overrides = {
              scratchpad = "📋";
            };
          }
          {
            block = "kdeconnect";
            format = " $icon $name ($bat_icon $bat_charge) ";
          }
          {
            block = "bluetooth";
            mac = "70:08:10:B1:E7:FB";
            format = " $icon $name ($percentage) ";
          }
          {
            block = "sound";
            device_kind = "sink";
            format = " $icon $volume ";
            headphones_indicator = true;
            show_volume_when_muted = true;
          }
          {
            block = "sound";
            device_kind = "source";
            format = " $icon $volume ";
            show_volume_when_muted = true;
          }
          {
            block = "backlight";
            minimum = 0;
            format = " $icon $brightness ";
          }
          {
            block = "disk_space";
            info_type = "used";
            warning = 80;
            alert = 90;
            icons_overrides = {
              disk_drive = "💾";
            };
            format = " $icon $percentage ($used/$total) ";
          }
          {
            block = "memory";
            icons_overrides = {
              memory_mem = "🧠";
            };
            format = " $icon $mem_used_percents ($mem_used/$mem_total) ";
          }
          {
            block = "cpu";
            interval = 1;
            icons_overrides = {
              cpu = "🫀";
            };
            format = " $icon $utilization ($frequency/$max_frequency) $barchart ";
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
        icons = "emoji";
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {
              separator = "<span font='14.5'></span>";
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
