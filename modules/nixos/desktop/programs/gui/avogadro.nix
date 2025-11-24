{
  flake.modules.nixos.avogadro = { pkgs, ...}: {
    environment.systemPackages = [
      pkgs.avogadro2
    ];
  };
}
