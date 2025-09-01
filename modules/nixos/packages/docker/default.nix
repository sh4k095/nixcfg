{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  users.users.sh4k0.extraGroups = [ "docker" ];
}
