topLevel@{ inputs, ... }: {
  flake.modules.nixos.home-manager = { config, ... }: 
    let
      inherit (config.networking) hostName;
      userName = "sh4k0";
    in {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        #extraSpecialArgs = { inherit inputs outputs; };
        users.${userName}.imports = [
          topLevel.config.flake.modules.homeManager.core
          (topLevel.config.flake.modules.homeManager."host_${hostName}" or { })
        ];
        extraSpecialArgs = {
          inputs = inputs;
          configName = "nixos_${hostName}";
          #nhSwitchCommand = "nh os switch";
        };
      };
    };
}
