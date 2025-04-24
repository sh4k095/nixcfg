{ config, pkgs, ... }:

{
  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = with pkgs; [
    alacritty
    firefox
    fuzzel
    zellij
    neovim
    telegram-desktop
    yazi
  ];

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  home.file = {
    ".config/sway/config".source = dotfiles/sway/config;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
