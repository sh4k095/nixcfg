{ config, lib, pkgs, ... }:

let
  mod = config.wayland.windowManager.sway.config.modifier;
in 
{
  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    # general
    "${mod}+q" = "kill";
    # applications
    "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
    "${mod}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
    # modes
    "${mod}+p" = "mode present";
    # special keys
    "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
    "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
    "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
    "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
    "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
  };
}
