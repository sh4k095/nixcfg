{
  flake.modules.nixos.home-manager = { inputs, outputs, ... }: {

    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs outputs; };
    };
  };
}
