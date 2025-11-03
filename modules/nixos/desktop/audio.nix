{
  flake.modules.nixos.sound = {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    users.users.sh4k0.extraGroups = [ "audio" ];
  };
}
