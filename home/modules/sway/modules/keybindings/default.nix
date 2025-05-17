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
  };
}
