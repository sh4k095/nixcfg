{ config, pkgs, ... }:

{
  home.username = "sh4k0";
  home.homeDirectory = "/home/sh4k0";

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = with pkgs; [
    alacritty
    firefox
    fuzzel
    imv
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
    ".config/alacritty/alacritty.toml".source = dotfiles/alacritty/alacritty.toml;
    ".config/alacritty/tokyonight_moon.toml".source = dotfiles/alacritty/tokyonight_moon.toml;
    ".config/fuzzel/fuzzel.ini".source = dotfiles/fuzzel/fuzzel.ini;
    ".config/fuzzel/tokyonight_moon.ini".source = dotfiles/fuzzel/tokyonight_moon.ini;
    ".config/i3status-rust/config.toml".source = dotfiles/i3status-rust/config.toml;
    ".config/sway/config".source = dotfiles/sway/config;
    ".config/sway/wp/sea.jpg".source = dotfiles/sway/wp/sea.jpg;
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
