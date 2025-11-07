{
  flake.modules.nixos.desktop = {
    environment.systemPackages = [
      discord-ptb
    ];
  };
}
