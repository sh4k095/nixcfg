{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    modules/hardware-configuration.nix
    ../../modules/desktop.nix
    ../../modules/firefox.nix
    ../../modules/gaming.nix
    #inputs.home-manager.nixosModules.home-manager
    ../../modules/nvidia.nix
    modules/boot.nix
    ../../users/sh4k0
  ];

  #home-manager = {
  #  extraSpecialArgs = { inherit inputs; };
  #  users = {
  #    sh4k0 = import ../../home/home.nix;
  #  };
  #};

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  networking.hostName = "erebus"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

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

  services.greetd = let
    sway-nvidia-wrapper = pkgs.writeShellScriptBin "sway-nvidia" ''
      export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card2 && exec ${pkgs.sway}/bin/sway
    '';
  in {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${sway-nvidia-wrapper}/bin/sway-nvidia";
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
  #  enable = true;
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
    (import scripts/nvidia-offload.nix { inherit pkgs; })
    (import scripts/xmage-sway.nix { inherit pkgs; })
    pkgs.winbox4
    pkgs.wireplumber
    pkgs.pwvucontrol
    pkgs.libsForQt5.qt5ct
    pkgs.fuzzel
    pkgs.networkmanagerapplet
    pkgs.ovito
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
      jupyterlab
  ]))
  ];

  #hardware.tuxedo-keyboard.enable = true;

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

