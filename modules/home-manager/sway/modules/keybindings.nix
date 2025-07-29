{ config, lib, pkgs, ... }:

let
  mod = config.wayland.windowManager.sway.config.modifier;
  fuzzel-powermenu = pkgs.callPackage ../../../../lib/fuzzel-powermenu.nix {};
in 
{
  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    # General
    "${mod}+q" = "kill";
    # Applications
    "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
    "${mod}+Shift+Return" = "exec ${pkgs.alacritty}/bin/alacritty -e ${pkgs.zellij}/bin/zellij -l welcome";
    "${mod}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";
    "${mod}+Delete" = "exec ${fuzzel-powermenu}/bin/fuzzel-powermenu";
    # Dropdown terminal
    "${mod}+Escape" = ''
      exec ${pkgs.sway}/bin/swaymsg '[app_id=dropdown-terminal] scratchpad show' \
      || ${pkgs.alacritty}/bin/alacritty --class dropdown-terminal \
      && sleep .1 && swaymsg ${pkgs.sway}/bin/swaymsg '[app_id=dropdown-terminal] resize set 100ppt 40ppt, move position 0 0'
    '';
    # Layouts
    "${mod}+t" = "layout tabbed";
    "${mod}+s" = "layout stacking";
    # Modes
    "${mod}+p" = "mode present";
    # Special keys
    "XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
    "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
    "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
  };
}
