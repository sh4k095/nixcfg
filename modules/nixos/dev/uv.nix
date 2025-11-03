{
  flake.modules.nixos.uv = {
    environment.systemPackages = with pkgs; [
      uv
    ];
    programs.nix-ld.enable = true;
  };
}
