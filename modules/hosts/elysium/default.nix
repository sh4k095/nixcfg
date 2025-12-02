{ config, ... }:

{
  nixosHosts.elysium.unstable = true;
  flake.modules.nixos.host_elysium = { pkgs, inputs, ... }:
  {
    imports = with config.flake.modules.nixos; [
      core
    ];
    networking.hostId = "bb5e3b6a";
    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${system}.default
    ];
    users.users = {
      sh4k0 = {
        isNormalUser = true;
        password = "test";
      };
      root = {
        password = "test";
      };
    };
  };
}
