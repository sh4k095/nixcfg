{
  description = "sh4k0's NixOS config";
 
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    LazyVim = {
      url = "github:matadaniel/LazyVim-module";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tuxedo-nixos = {
      url = "github:blitz/tuxedo-nixos";
    };
  };

  outputs = { self, nixpkgs, nixvim, home-manager, tuxedo-nixos, ... }@inputs:
  let
    inherit (self) outputs;
    systems = [ 
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in
  {
    # NixOS multi-host configuration
    nixosConfigurations = {
      erebus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/erebus
          tuxedo-nixos.nixosModules.default
          {
            hardware.tuxedo-control-center = {
              enable = true;
              package = tuxedo-nixos.packages.x86_64-linux.default;
            };
          }
        ];
      };
    };
    # home-manager standalone configuration
    homeConfigurations = {
      "sh4k0@erebus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/home.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
