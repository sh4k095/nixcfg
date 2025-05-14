{ config, lib, pkgs, ... }:

let
  mod = config.wayland.windowManager.sway.config.modifier;
in 
{
  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
    "${mod}+f" = "exec ${pkgs.firefox}/bin/firefox";
  };
}
