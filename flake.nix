{
  description = "sh4k0's NixOS config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
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
    nixpkgs-wayland,
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
        modules = [({ pkgs, config, ... }: {
          config = {
            nix.settings = {
              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
              ];
              substituters = [
                "https://cache.nixos.org"
                "https://nixpkgs-wayland.cachix.org"
              ];
            };
            nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
          };})
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
          ./hosts/hamera
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
          ./hosts/ceto
        ];
      };
    };
  };
}
