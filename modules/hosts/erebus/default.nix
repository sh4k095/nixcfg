{ config, ... }:

{
  nixosHosts.erebus.unstable = true;
  flake.modules.nixos.host_erebus =
  {
    imports = [
      config.flake.modules.nixos.wayland
    ];
  };
}
