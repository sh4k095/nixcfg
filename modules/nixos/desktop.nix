{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    autotiling-rs
    grim
    slurp
    wl-clipboard
    wl-mirror
    mako
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = false;
    extraPackages = [];
  };
}
