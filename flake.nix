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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tuxedo-nixos = {
      url = "github:blitz/tuxedo-nixos";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    nix-on-droid,
    tuxedo-nixos,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS multi-host configuration
    nixosConfigurations = {
      erebus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/erebus
          tuxedo-nixos.nixosModules.default
          {
            hardware = {
              tuxedo-control-center = {
                enable = true;
                package = tuxedo-nixos.packages.x86_64-linux.default;
              };
              tuxedo-drivers.enable = true;
            };
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sh4k0 = ./home;
              extraSpecialArgs = {inherit inputs outputs;};
            };
          }
        ];
      };
    };
    # home-manager standalone configurations
    homeConfigurations = {
      "sh4k0@erebus" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "x86_64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/home.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
      "sh4k0@hemera" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "x86_64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/steamdeck.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
    # nix-on-droid configuration
    nixOnDroidConfigurations = {
      "ceto" = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs {system = "aarch64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./nix-on-droid
        ];
      };
    };
  };
}
