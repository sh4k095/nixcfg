{ config, ... }:

{
  nixosHosts.erebus.unstable = true;
  flake.modules.nixos.host_erebus =
  {
    imports = with config.flake.modules.nixos; [
      desktop
      dev
    ];
  };
}
