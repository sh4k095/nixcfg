{ config, ... }:

{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    android
    avogadro
    audio
    bluetooth
    discord
    #firefox
    home-manager
    mpv
    qbittorrent
    steam
    sway
    wayland
    winbox
  ];
}
