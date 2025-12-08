{
  flake.modules.nixos.docker = {
    virtualisation.docker = {
      enable = true;
    };
    users.users.sh4k0.extraGroups = [ "docker" ];
  };
}
