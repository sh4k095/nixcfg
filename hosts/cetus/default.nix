{ inputs, config, lib, pkgs, outputs, ... }:

{
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ../../users/sh4k0
    inputs.sops-nix.nixosModules.sops
  ];
  
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  networking = {
    hostName = "cetus";
    networkmanager.enable = true;
  };

  sops = {
    age.sshKeyPaths = [ "/etc/ssh/cetus_ed25519" ];
    defaultSopsFile = ../../secrets/hosts/cetus/secrets.yaml;
    secrets = {
      "passwords/sh4k0" = { neededForUsers = true; };
      "passwords/root" = { neededForUsers = true; };
      "tailscale/authkey" = {};
    };
  };

  users = {
    mutableUsers = false;
    users = {
      sh4k0 = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
        hashedPasswordFile = config.sops.secrets."passwords/sh4k0".path;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAiZT8XMTeQwU36Rj5Ls+h0+zy+LSz/T72symouM7z8O sh4k0@erebus"
        ];
      };
      root = {
        hashedPasswordFile = config.sops.secrets."passwords/root".path;
      };
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        #PasswordAuthentication = false;
      };
    };
    tailscale = {
      enable = true;
      authKeyFile = config.sops.secrets."tailscale/authkey".path;
      extraSetFlags = [
        "--advertise-routes=192.168.88.0/24"
      ];
      useRoutingFeatures = "both";
    };
    adguardhome = {
      enable = true;
      settings = {
        http = {
          address = "127.0.0.1:3000";
        };
      };
    };
    automatic-timezoned = {
      enable = true;
    };
    geoclue2 = {
      enable = true;
      geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
    };
  };
  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    kernelModules = [ "kvm-intel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    sops
  ];

  system.stateVersion = "25.11";
}
