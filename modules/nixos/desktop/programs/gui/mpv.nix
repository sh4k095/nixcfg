{
  flake.modules.nixos.mpv = { pkgs, ... }: {
    environemnt.systemPackages = with pkgs; [
      mpv
    ];
  };
}
