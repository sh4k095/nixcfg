{
  flake.modules.nixos.wayland = { inputs, pkgs, ...}:
  {
    nix.settings = {
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
      ];
    };
    nixpkgs.overlays = [
      inputs.nixpkgs-wayland.overlay
    ];
    users.users.sh4k0.extraGroups = [ "video" ];
    security.polkit.enable = true;
    programs.sway = {
      enable = true;
      extraPackages = [ ];
      xwayland.enable = false;
    };
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      powerline-fonts
      powerline-symbols
    ];
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
    services = {
      displayManager.defaultSession = "sway";
      libinput.enable = true;
      #xserver.xkb.layout = "us";
    };
    environment.systemPackages = [ inputs.noctalia.packages."x86_64-linux".default ];
  };
}
