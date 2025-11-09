{ config, ... }:

{
  nixosHosts.elysium.unstable = true;
  flake.modules.nixos.host_elysium =
  {
    imports = with config.flake.modules.nixos; [
      core
    ];
    networking.hostId = "bb5e3b6a";
  };
}
