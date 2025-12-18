{
  flake.modules.nixos.users = { pkgs, ... }: {
    users = {
      mutableUsers = false;
      users = {
        root = {
          isSystemUser = true;
        };
        sh4k0 = {
          group = "sh4k0";
          isNormalUser = true;
          uid = 1000;
          shell = pkgs.zsh;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO2Yr/kP45KafIBopwolJ9bqpIlHUZSbbmIefu6PuVQd sh4k0@erebus"
          ];
        };
      };
      groups.sh4k0.gid = 1000;
    };
  };
}
