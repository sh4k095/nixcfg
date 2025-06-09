{ config, lib, pkgs, ... }:

let
  mod = config.wayland.windowManager.sway.config.modifier;
  fuzzel-powermenu = pkgs.callPackage ../../../../lib/fuzzel-powermenu.nix {};
in 
{
  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    # general
    "${mod}+q" = "kill";
    # applications
    "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
    "${mod}+Shift+Return" = "exec ${pkgs.alacritty}/bin/alacritty -e ${pkgs.zellij}/bin/zellij -l welcome";
    "${mod}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
    "${mod}+Delete" = "exec ${fuzzel-powermenu}/bin/fuzzel-powermenu";
    # modes
    "${mod}+p" = "mode present";
    # special keys
    "XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
    "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
  };
}
