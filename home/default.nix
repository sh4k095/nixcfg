{ inputs, config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/alacritty
    ../modules/home-manager/swaylock
    ../modules/home-manager/fuzzel.nix
    ../modules/home-manager/theme.nix
    ../modules/home-manager/sway
    ../modules/home-manager/swaync
    ../modules/home-manager/nvim
    ../modules/home-manager/i3status-rust
    ../modules/home-manager/zellij
    #./modules/btop.nix
    #inputs.LazyVim.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  services.kdeconnect.enable = true;

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = [
    
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
  qt.enable = true;
  #gtk.theme.name = "arc-dark";
  home.file = {
    #".config/alacritty" = {
    #  source = dotfiles/alacritty;
    #  recursive = true;
    #  };
    #".config/fuzzel" = {
    #  source = dotfiles/fuzzel;
    #  recursive = true;
    #};
    ".config/sway/wp.png".source = ../modules/home-manager/sway/modules/wp.png;
  };

  home.stateVersion = "25.05";
}
