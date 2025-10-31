{ inputs, config, pkgs, ... }:

{
  imports = [
    ../_modules/home-manager/alacritty
    ../_modules/home-manager/direnv
    ../_modules/home-manager/starship
    ../_modules/home-manager/colorscheme
    ../_modules/home-manager/colorscheme/schemes/gruvbox-dark.nix
    ../_modules/home-manager/btop
    ../_modules/home-manager/helix
    ../_modules/home-manager/zsh
    #../../../modules/home-manager/bat
    ../_modules/home-manager/mittelab
    ../_modules/home-manager/swaylock
    ../_modules/home-manager/git
    ../_modules/home-manager/fuzzel
    #../../../modules/home-manager/theme.nix
    ../_modules/home-manager/theme
    ../_modules/home-manager/sway
    ../_modules/home-manager/swaync
    ../_modules/home-manager/nvim
    ../_modules/home-manager/i3status-rust
    ../_modules/home-manager/zellij
    ../_modules/home-manager/zathura
    ../_modules/home-manager/ssh
    inputs.nixvim.homeModules.nixvim
    inputs.sops-nix.homeManagerModules.sops
  ];

  zsh.enable = true;
  #bat.enable = true;
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

  xdg = {
    enable = true;
    userDirs.createDirectories = true;
  };

  # targets.genericLinux.enable = true; # enable on non-NixOS

  home.packages = with pkgs; [
    android-tools
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.it_IT
    tldr
    eza
    gopass
    swappy
    bat
    mpv
    bashmount
    bc
    ripgrep
    fastfetch
    devenv
    wl-mirror
    kdePackages.dolphin
    kdePackages.qtsvg
    #kdePackages.breeze-gtk
    #kdePackages.breeze
    mattermost-desktop
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
    #maestral-gui
    lammps
    fishPlugins.gruvbox
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
    ".config/sway/wp.png".source = ../_modules/home-manager/sway/modules/wp.png;
  };

  sops = {
    age.sshKeyPaths = [ "/home/sh4k0/.ssh/erebus_ed25519" ];
    defaultSopsFile = ../../../../.secrets/hosts/erebus/secrets.yaml;
    secrets = {
      "ssh_hosts/vsc4/user" = {};
      "ssh_hosts/vsc4/hostname" = {};
      "ssh_hosts/vsc5/user" = {};
      "ssh_hosts/vsc5/hostname" = {};
      "ssh_hosts/datalab/user" = {};
      "ssh_hosts/datalab/hostname" = {};
      "ssh_hosts/datalab/identity" = {};
      "ssh_hosts/github/identity" = {};
      "ssh_hosts/gitlab/identity" = {};
      "ssh_hosts/cetus/user" = {};
      "ssh_hosts/cetus/hostname" = {};
      "ssh_hosts/cetus/identity" = {};
      "ssh_hosts/cetus/user" = {};
      "ssh_hosts/cetus/hostname" = {};
      "ssh_hosts/cetus/identity" = {};
      "ssh_hosts/leonardo/user" = {};
      "ssh_hosts/leonardo/hostname" = {};
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
          Host datalab
            User ${config.sops.placeholder."ssh_hosts/datalab/user"}
            Hostname ${config.sops.placeholder."ssh_hosts/datalab/hostname"}
            IdentityFile ${config.sops.placeholder."ssh_hosts/datalab/identity"}
          Host github.com
            IdentityFile ${config.sops.placeholder."ssh_hosts/github/identity"}
          Host gitlab.com
            IdentityFile ${config.sops.placeholder."ssh_hosts/gitlab/identity"}
          Host cetus
            User ${config.sops.placeholder."ssh_hosts/cetus/user"}
            Hostname ${config.sops.placeholder."ssh_hosts/cetus/hostname"}
            IdentityFile ${config.sops.placeholder."ssh_hosts/cetus/identity"}
          Host leonardo
            User ${config.sops.placeholder."ssh_hosts/leonardo/user"}
            Hostname ${config.sops.placeholder."ssh_hosts/leonardo/hostname"}
        '';
        path = "/home/sh4k0/.ssh/config.d/ssh_hosts";
      };
    };
  };

  home.stateVersion = "25.05";
}
