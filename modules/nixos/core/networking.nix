{
  flake.modules.nixos.networking = { pkgs, ... }: {
    networking.networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openconnect
      ];
    };
    services.tailscale = { 
      enable = true;
      extraSetFlags = [
        "--accept-routes"
      ];
    };
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
