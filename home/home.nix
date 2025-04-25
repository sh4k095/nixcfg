{ config, pkgs, ... }:

{
  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = with pkgs; [
    alacritty
    firefox
    fuzzel
    i3status-rust
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
    ".config/fuzzel/fuzzel.ini".source = dotfiles/fuzzel/fuzzel.ini;
    ".config/fuzzel/tokyonight_moon.ini".source = dotfiles/fuzzel/tokyonight_moon.ini;
    ".config/alacritty/alacritty.toml".source = dotfiles/alacritty/alacritty.toml;
    ".config/alacritty/tokyonight_moon.toml".source = dotfiles/alacritty/tokyonight_moon.toml;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
