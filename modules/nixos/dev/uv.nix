{
  flake.modules.nixos.uv = { pkgs, ... }: {
    environment = {
      systemPackages = with pkgs; [
        uv
      ];
      localBinInPath = true;
    };
    programs.nix-ld.enable = true;
  };
}
