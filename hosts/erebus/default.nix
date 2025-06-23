{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    modules/hardware-configuration.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/firefox.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/nvidia.nix
    modules/boot.nix
    ../../users/sh4k0
  ];

  # Enable flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "sh4k0" ];
  };

  programs.adb.enable = true;
  programs.thunderbird.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config = {
    #enableParallelBuildingByDefault = true;
    #cudaSupport = true;
    rocmSupport = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
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

#  nixpkgs.overlays = [(final: prev: { ovito = prev.ovito.overrideAttrs  rec {
#  version = "3.12.2";
#  src = final.fetchFromGitLab {
#    owner = "stuko";
#    repo = "ovito";
#    rev = "v${version}";
#    hash = "sha256-qpKQAO2f1TfspqjbCLA/3ERWdMeknKe0a54yd9PZbsA=";
#    fetchSubmodules = true;
#  };
#}; })];

  networking.hostName = "erebus";
  networking.networkmanager.enable = true;

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  #programs.sway.enable = true;
  #services.xserver = {
  #  enable = true;
  #  desktopManager = {
  #    xterm.enable = false;
  #  };
  #  windowManager.i3.enable = true;
  #};
  #programs.i3lock.enable = true;

  #services.xserver.displayManager.sessionPackages = let
  #  sway-nvidia = pkgs.writeShellScriptBin "Sway-NVIDIA" ''
  #    ${pkgs.sway}/bin/sway --unsupported-gpu
  #  '';
  #  in
  #    [
  #      {
  #        manage = "window";
  #        name = "Sway-NVIDIA";
  #        start = "${sway-nvidia}/bin/sway-nvidia -ls && waitPID=$!";
  #      }
  #    ];
      

  services.greetd = let
    sway-igpu = pkgs.writeShellScriptBin "sway-igpu" ''
      export WLR_DRM_DEVICES=/dev/dri/card2 && exec ${pkgs.sway}/bin/sway
    '';
  in {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${sway-igpu}/bin/sway-igpu";
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


  #services.cpupower-gui.enable = true;
  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  #hardware.tuxedo-rs = {
  #  enable = tue;
  #  tailor-gui.enable = true;
  #};

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

  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #environment.systemPackages = with pkgs; [
  environment.systemPackages = [
    #(import ../../lib/nvidia-offload.nix { inherit pkgs; })
    (import ../../lib/xmage-sway.nix { inherit pkgs; })
    (pkgs.btop.override { rocmSupport = true; cudaSupport = true; })
    pkgs.swaybg
    pkgs.winbox4
    pkgs.wireplumber
    pkgs.pwvucontrol
    pkgs.libsForQt5.qt5ct
    pkgs.fuzzel
    pkgs.networkmanagerapplet
    pkgs.gcc
    pkgs.git
    pkgs.alsa-utils
    pkgs.udisks
    pkgs.brightnessctl
    pkgs.helvum
    pkgs.ueberzugpp
    pkgs.vim
    pkgs.wget
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      #numpy
      #scipy
      #ase
      #pymatgen
      #jupyterlab
  ]))
  ];

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
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    powerline-fonts
    powerline-symbols
  ];

  #programs.steam = {
  #  enable = true;
  #  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  #};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
networking.firewall = rec {
  allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  allowedUDPPortRanges = allowedTCPPortRanges;
};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

