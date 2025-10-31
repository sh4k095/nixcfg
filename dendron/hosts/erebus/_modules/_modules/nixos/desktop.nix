{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autotiling-rs
    grim
    slurp
    wl-clipboard
    wl-mirror
    mako
  ];
}
