{ config, ... }:

{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    android
    audio
    bluetooth
    steam
    wayland
    #winbox
  ];
}
