{
  nixosHosts.installer.unstable = true;

  flake.modules.nixos.host_installer = { pkgs, modulesPath, ... }: {

    imports = [
      (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
      (modulesPath + "/installer/cd-dvd/channel.nix")
    ];
    
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };

    users.users = {
      nixos = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        password = "nixos";
      };
      root = {
        password = "nixos";
      };
    };
  
    security.sudo.wheelNeedsPassword = false;
  
    environment.systemPackages = with pkgs; [
      git
      rsync
      neovim
      wget
      curl
    ];
  
    networking = {
      hostName = "installer";
      networkmanager.enable = true;
    };
  
    services.openssh = {
      enable = true;
      passwordAuthentication = true;
    };
  };
}
