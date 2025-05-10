{ inputs, config, pkgs, ... }:

{
  imports = [
    ./modules/theme.nix
    ./modules/i3status-rust.nix
    #./modules/btop.nix
    inputs.LazyVim.homeManagerModules.default
  ];

  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = [
    #pkgs.btop
    pkgs.vimPlugins.LazyVim
    #python3.12Packages.jupyterlab
    pkgs.alacritty
    pkgs.android-tools
    #pkgs.kdePackages.dolphin
    #pkgs.firefox
    pkgs.fuzzel
    pkgs.imv
    pkgs.i3status-rust
    #pkgs.ovito
    pkgs.zellij
    #pkgs.neovim
    pkgs.telegram-desktop
    pkgs.yazi
    pkgs.maestral
    pkgs.maestral-gui
    pkgs.lammps
    pkgs.calibre
    pkgs.devenv
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    ".config/alacritty" = {
      source = dotfiles/alacritty;
      recursive = true;
      };
    ".config/fuzzel" = {
      source = dotfiles/fuzzel;
      recursive = true;
    };
    ".config/sway" = {
      source = dotfiles/sway;
      recursive = true;
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  programs.lazyvim.enable = true;
}
