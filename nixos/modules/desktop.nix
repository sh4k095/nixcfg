{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  program.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = false;
  };
}
