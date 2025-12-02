{
  flake.modules.nixos.users = { pkgs, ... }: {
    users = {
      mutableUsers = false;
      users = {
        root = {
          isSystemUser = true;
        };
        sh4k0 = {
          isNormalUser = true;
          uid = 1000;
          shell = pkgs.zsh;
          group = "sh4k0";
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
        };
      };
      groups = {
        sh4k0.gid = 1000;
      };
    };
  };
}
