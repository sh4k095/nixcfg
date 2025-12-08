{
  flake.modules.nixos.mpv = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mpv
    ];
  };
}
