{ pkgs, ... }:

{
  imports = [
    #<nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    #<nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
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
    #settings = {
    #  PasswordAuthentication = false;
    #  LoginGraceTime = 0;
    #};
  };
}
