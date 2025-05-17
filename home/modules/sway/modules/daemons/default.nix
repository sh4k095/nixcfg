{ config, pkgs, ... }:

{
  config.wayland.windowManager.sway.config.startup = [
    { command = "${pkgs.autotiling-rs}/bin/autotiling-rs"; always = true; }
    { command = ''
      swayidle -w \
      timeout 300 "swaylock -f -c 000000" \
      timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
      before-sleep  'playerctl pause' \
      before-sleep 'swaylock -f -c 000000' \
      '';
    }
  ];
}
