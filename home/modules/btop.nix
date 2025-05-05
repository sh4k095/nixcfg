{ config, lib, pkgs, ... }:

programs.btop = {
  enable = true;
  color_theme = "dusklight";
  theme_background = false;
}
