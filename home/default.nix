{ inputs, config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/alacritty
    ../modules/home-manager/helix
    ../modules/home-manager/shell
    ../modules/home-manager/bat
    ../modules/home-manager/swaylock
    ../modules/home-manager/git
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
    inputs.sops-nix.homeManagerModules.sops
    inputs.nix-colors.homeManagerModules.default
  ];

  colorscheme = inputs.nix-colors.colorSchemes.dracula;

  zsh.enable = true;
  bat.enable = true;
  zathura.enable = true;
  zellij.enable = true;

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
    zotero
    alacritty
    android-tools
    sops
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
    helix
    maestral-gui
    lammps
    calibre
    #devenv
    powerline-symbols
    swaylock-effects
    zoxide
    inkscape
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

  sops = {
    age.keyFile = "/home/sh4k0/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/hosts/erebus/secrets.yaml;
    secrets = {
      "ssh_hosts/vsc4/user" = {};
      "ssh_hosts/vsc4/hostname" = {};
      "ssh_hosts/vsc5/user" = {};
      "ssh_hosts/vsc5/hostname" = {};
      "ssh_hosts/github/identity" = {};
      "ssh_hosts/gitlab/identity" = {};
    };
    templates = {
      "ssh_hosts" = {
        content = ''
          Host vsc4
            User ${config.sops.placeholder."ssh_hosts/vsc4/user"}
            Hostname ${config.sops.placeholder."ssh_hosts/vsc4/hostname"}
          Host vsc5
            User ${config.sops.placeholder."ssh_hosts/vsc5/user"}
            Hostname ${config.sops.placeholder."ssh_hosts/vsc5/hostname"}
          Host github.com
            IdentityFile ${config.sops.placeholder."ssh_hosts/github/identity"}
          Host gitlab.com
            IdentityFile ${config.sops.placeholder."ssh_hosts/gitlab/identity"}
        '';
        path = "/home/sh4k0/.ssh/config.d/ssh_hosts";
      };
    };
  };

  home.stateVersion = "25.05";
}
