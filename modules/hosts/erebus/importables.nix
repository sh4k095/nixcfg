{
  flake.modules.nixos.host_erebus =

  { inputs, config, options, lib, pkgs, outputs, ... }:

  {
    imports = [
        #_modules/nixos/firefox.nix
        #_modules/nixos/packages/docker
      _modules/nixos/packages/sway
      _modules_specific/boot.nix
        #_users/sh4k0
      inputs.sops-nix.nixosModules.sops
    ];

    boot.kernel.sysctl."fs.inotify.max_user_watches" = 1048576;
    
      #sway = {
      #  enable = true;
      #  withNvidiaGPU = true;
      #  withXWayland = false;
      #};

    home-manager.users.sh4k0 = ./_modules_specific/home.nix;
  
      #nix = {
      #  settings = {
      #    experimental-features = "nix-command flakes";
      #    auto-optimise-store = true;
      #    trusted-users = [
      #      "sh4k0"
      #      "root"
      #    ];
      #  };
      #    gc = {
      #      automatic = true;
      #      dates = "weekly";
      #      options = "--delete-older-than 7d";
      #    };
      #};
    programs.thunderbird.enable = true;
    programs.zsh.enable = true;
  
    nixpkgs.config = {
      #enableParallelBuildingByDefault = true;
      #cudaSupport = true;
      #rocmSupport = true;
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "discord-ptb"
        # CUDA
        #"cuda_cudart"
        #"cuda_cccl"
        #"libnpp"
        #"libcublas"
        #"libcufft"
        #"cuda_nvcc"
        # Nvidia
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
        # Steam
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        # winbox
        "winbox"
        "winbox4"
      ];
    };


  nixpkgs.overlays = [
    (final: prev: {xmage = prev.xmage.overrideAttrs rec {
      panme = "xmage";
      version = "1.4.58-dev_2025-10-06_20-40";
      src = final.fetchurl {
        url = "http://xmage.today/files/mage-full_${version}.zip";
        sha256 = "sha256-UOtxV+ykDIH+PLjLrC66Rut92IIw2iDHWwvJ2ytmUAs=";
      };
    };

    #  (final: prev: {maestral = prev.maestral.overrideAttrs rec {
    #    version = "1.9.5";
    #    src = final.fetchFromGitHub {
    #      owner = "SamSchott";
    #      repo = "maestral";
    #      tag = "v${version}";
    #      hash = "sha256-xFSnJPKTAPXYa4FuqkFF5gLzGZ9TltNVDhyBnswiut4=";
    #    };
    #    dependencies = with pkgs.python313Packages; [
    #      click
    #      desktop-notifier
    #      dbus-python
    #      dropbox
    #      fasteners
    #      keyring
    #      keyrings-alt
    #      packaging
    #    ];
    #  };
    #  })#  
    #  (final: prev: {maestral-qt = prev.maestral-qt.overrideAttrs rec {
    #    version = "1.9.5";
    #    src = final.fetchFromGitHub {
    #      owner = "SamSchott";
    #      repo = "maestral-qt";
    #      tag = "v${version}";
    #      hash = "sha256-FCn9ELbodk+zCJNmlOVoxE/KSSqbxy5HTB1vpiu7AJA=";
    #    };
    #  };
    })#  
  ];
  
      #    networking.hostName = "erebus";
      #    networking.networkmanager = {
      #      enable = true;
      #      plugins = [
      #        pkgs.networkmanager-openconnect
      #      ];
      #    };
      #    services.tailscale = { 
      #      enable = true;
      #      extraSetFlags = [
      #        "--accept-routes"
      #      ];
      #    };
      #    services.mullvad-vpn = {
      #      enable = true;
      #      package = pkgs.mullvad-vpn;
      #    };
    programs.niri.enable = true;
    services.greetd = let
      sway-igpu = pkgs.writeShellScriptBin "sway-igpu" ''
        export WLR_DRM_DEVICES=/dev/dri/igpu1 && exec ${pkgs.sway}/bin/sway
      '';
      sway-nvidia = pkgs.writeShellScriptBin "sway-nvidia" ''
        exec ${pkgs.sway}/bin/sway --unsupported-gpu
      '';
    in {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${sway-nvidia}/bin/sway-nvidia";
          user = "sh4k0";
        };
      };
    };
  
    services.automatic-timezoned.enable = true;
    services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
    services.devmon.enable = true;
    services.gvfs.enable = true; 
    services.udisks2.enable = true;
  
    # Configure keymap in X11
    # services.xserver.xkb.layout = "us";
    # services.xserver.xkb.options = "eurosign:e,caps:escape";
  
    # Enable CUPS to print documents.
    # services.printing.enable = true;
  
  
    # Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;
  
    # Define a user account. Don't forget to set a password with ‘passwd’.
    #users.users.sh4k0 = {
    #  isNormalUser = true;
    #  extraGroups = [ "wheel" "seat" "networkmanager" ]; # Enable ‘sudo’ for the user.
    #  packages = with pkgs; [
    #    tree
    #  ];
    #};
      #services.qbittorrent = {
      #  enable = true;
      #  package = pkgs.qbittorrent-enhanced;
      #};
  
    # programs.firefox.enable = true;
  
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    #environment.systemPackages = with pkgs; [
    environment.systemPackages = [
      #(import ../../lib/nvidia-offload.nix { inherit pkgs; })
      (import _lib/xmage-sway.nix { inherit pkgs; })
      #(pkgs.btop.override { rocmSupport = true; cudaSupport = true; })
      pkgs.kdePackages.dolphin
      pkgs.wireguard-tools
      pkgs.cmake
      pkgs.pinentry-curses
      pkgs.bitwarden-desktop
      pkgs.yubikey-manager
      pkgs.yubikey-personalization
      pkgs.swaybg
      pkgs.jetbrains.pycharm-community
      pkgs.step-cli
      pkgs.libinput
      pkgs.networkmanager-openconnect
      pkgs.openconnect
      pkgs.chromium
      pkgs.wireplumber
      pkgs.pwvucontrol
      pkgs.swayosd
      pkgs.libsForQt5.qt5ct
      pkgs.networkmanagerapplet
      pkgs.gcc
      pkgs.git
      pkgs.alsa-utils
      pkgs.udisks
      pkgs.brightnessctl
      pkgs.ueberzugpp
      pkgs.texlive.combined.scheme-full
      pkgs.vim
      pkgs.wget
    ];
    programs.nix-ld = {
      enable = true;
      libraries = options.programs.nix-ld.libraries.default ++ (
        with pkgs; [
          dbus
          wayland
          glib
          libGL
          fontconfig
          xorg.libX11
          libxkbcommon
          freetype
          krb5
          libdrm
        ]
      );
    };
    environment.sessionVariables = rec {
      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      XDG_STATE_HOME  = "$HOME/.local/state";
      XDG_BIN_HOME    = "$HOME/.local/bin";
      PATH = [ 
        "${XDG_BIN_HOME}"
        "$HOME/.cargo/bin"
      ];
      QT_QPA_PLATFORM = "wayland";
    };
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style= "kvantum";
    };
    fonts.packages = with pkgs; [
      hack-font
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      powerline-fonts
      powerline-symbols
    ];
    services.pcscd.enable = true;
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
      enableSSHSupport = true;
    };
  
    system.stateVersion = "24.11";
  };
}
