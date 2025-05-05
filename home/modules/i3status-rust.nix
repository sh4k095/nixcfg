{ config, lib, pkgs, ... }

programs.i3status-rust = {
  enable = true;
  theme =  {
    theme = "solarized-dark";
    overrides = {
      idle_bg = "#123456";
      idle_fg = "#abcdef";
    };
  };
}
