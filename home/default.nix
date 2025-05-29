{ inputs, config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty
    ./modules/swaylock
    ./modules/fuzzel.nix
    ./modules/theme.nix
    ./modules/sway
    ./modules/nvim
    ./modules/i3status-rust
    ./modules/zellij
    #./modules/btop.nix
    #inputs.LazyVim.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

services.kdeconnect.enable = true;


  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = [
    #pkgs.btop
    pkgs.ripgrep
    pkgs.fastfetch
    pkgs.wl-mirror
    pkgs.vimPlugins.LazyVim
    #python3.12Packages.jupyterlab
    pkgs.alacritty
    pkgs.android-tools
    pkgs.waybar
    #pkgs.kdePackages.dolphin
    #pkgs.firefox
    #pkgs.fuzzel
    pkgs.autotiling-rs
    pkgs.xmage
    pkgs.imv
    pkgs.i3status-rust
    #pkgs.ovito
    #pkgs.neovim
    pkgs.telegram-desktop
    pkgs.yazi
    pkgs.maestral
    pkgs.maestral-gui
    pkgs.lammps
    pkgs.calibre
    pkgs.devenv
    pkgs.powerline-symbols
    pkgs.swaylock-effects
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    #".config/alacritty" = {
    #  source = dotfiles/alacritty;
    #  recursive = true;
    #  };
    #".config/fuzzel" = {
    #  source = dotfiles/fuzzel;
    #  recursive = true;
    #};
    ".config/sway/wp.png".source = modules/sway/modules/wp.png;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  #programs.lazyvim.enable = true;
}
