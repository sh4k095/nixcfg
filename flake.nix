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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
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
    sops-nix,
    disko,
    nixvim,
    nix-on-droid,
    tuxedo-nixos,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      # erebus
      erebus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/erebus
          sops-nix.nixosModules.sops
          tuxedo-nixos.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sh4k0 = ./hosts/erebus/modules/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };
      # cetus
      cetus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/cetus
          sops-nix.nixosModules.sops
          disko.nixosModules.disko
        ];
      };
      # installer
      installer = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ({ pkgs, modulesPath, ... }: {
            imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
          })
          ./hosts/installer
        ];
      };
    };
    homeConfigurations = {
      # tartarus
      "sh4k0@erebus" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "x86_64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home
          nixvim.homeModules.nixvim
          sops-nix.homeManagerModules.sops
        ];
      };
      "sh4k0@hemera" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "x86_64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/hamera
          nixvim.homeModules.nixvim
          sops-nix.homeManagerModules.sops
        ];
      };
    };
    # Nix-on-droid configuration
    nixOnDroidConfigurations = {
      "hamera" = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs {system = "aarch64-linux";};
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/ceto
        ];
      };
    };
  };
}
