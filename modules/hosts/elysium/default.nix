{ config, ... }:

{
  nixosHosts.elysium.unstable = true;
  flake.modules.nixos.host_elysium =
  {
    imports = with config.flake.modules.nixos; [
      core
    ];
  };
}
