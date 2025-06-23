{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../modules/home-manager/alacritty
    ../modules/home-manager/nvim
    ../modules/home-manager/zellij
  ];

  targets.genericLinux.enable = true;
  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  services.kdeconnect.enable = true;


  home.packages = with pkgs; [
    pkgs.btop
    pkgs.ripgrep
    pkgs.fastfetch
    pkgs.wl-mirror
    pkgs.vimPlugins.LazyVim
    python3.12Packages.jupyterlab
    pkgs.alacritty
    pkgs.android-tools
    pkgs.waybar
    pkgs.kdePackages.dolphin
    pkgs.firefox
    pkgs.fuzzel
    pkgs.autotiling-rs
    pkgs.xmage
    pkgs.imv
    pkgs.i3status-rust
    pkgs.ovito
    pkgs.neovim
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

  home.stateVersion = "25.05";
  #programs.home-manager.enable = true;
  #programs.lazyvim.enable = true;
}
