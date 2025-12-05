{ config, ... }:

{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    android
    avogadro
    audio
    bluetooth
    discord
    firefox
    home-manager
    steam
    sway
    wayland
    winbox
  ];
}
