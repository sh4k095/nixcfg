{ config, pkgs, ... }:

{
  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = [
    pkgs.firefox
    pkgs.fuzzel
    pkgs.hello
    pkgs.neovim
  ];

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  home.file = {
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
