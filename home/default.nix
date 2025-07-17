{ inputs, config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/alacritty
    ../modules/home-manager/shell
    ../modules/home-manager/bat
    ../modules/home-manager/swaylock
    ../modules/home-manager/fuzzel
    #../modules/home-manager/theme.nix
    ../modules/home-manager/sway
    ../modules/home-manager/swaync
    ../modules/home-manager/nvim
    ../modules/home-manager/i3status-rust
    ../modules/home-manager/zellij
    ../modules/home-manager/zathura
    ../modules/home-manager/ssh
    inputs.nixvim.homeManagerModules.nixvim
  ];

  zsh.enable = true;
  bat.enable = true;
  zathura.enable = true;

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    persistent = true;
  };

  programs.gpg.enable = true;

  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  services.kdeconnect.enable = true;

  alacritty.enable = true;

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = with pkgs; [
    android-tools
    tldr
    eza
    swappy
    bat
    mpv
    bashmount
    bc
    ripgrep
    fastfetch
    wl-mirror
    alacritty
    android-tools
    waybar
    #pkgs.kdePackages.dolphin
    #pkgs.firefox
    #pkgs.fuzzel
    autotiling-rs
    xmage
    imv
    i3status-rust
    #pkgs.ovito
    #pkgs.neovim
    ovito
    telegram-desktop
    yazi
    maestral
    maestral-gui
    lammps
    calibre
    #devenv
    powerline-symbols
    swaylock-effects
    zoxide
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
  #programs.zsh = {
  #  enable = true;
  #};
}
