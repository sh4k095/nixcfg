{
  flake.modules.nixos.qbittorrent = { pkgs, ... }: {
    environemnt.systemPackages = with pkgs; [
      qbittorrent-enhanced
    ];
  };
}
