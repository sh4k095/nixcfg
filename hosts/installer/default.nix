{ inputs, config, lib, pkgs, outputs, ... }:

{
  imports = [
    ../../users/sh4k0
  ];
  
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  networking = {
    hostName = "installer";
    networkmanager.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        #PasswordAuthentication = false;
      };
    };
  };
}
