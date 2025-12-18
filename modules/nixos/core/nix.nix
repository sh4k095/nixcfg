{
  flake.modules.nixos.nix = {
    nixpkgs.config = {
      allowUnfree = true;
    };
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 5 --keep-since 8d";
      };
    };
    nix = {
      settings = {
        experimental-features = "nix-command flakes";
        max-jobs = "auto";
        use-xdg-base-directories = true;
        http-connections = 128;
        max-substitution-jobs = 128;
        log-lines = 25;
        min-free = 128000000; # 128 MB
        max-free = 1000000000; # 1 GB

        # Prevent garbage collection from altering nix-shells managed by nix-direnv
        # https://github.com/nix-community/nix-direnv#installation
        keep-outputs = true;
        keep-derivations = true;
        auto-optimise-store = true;
        warn-dirty = false;
        connect-timeout = 5;
        trusted-users = [
          "root"
          "@wheel"
        ];
        builders-use-substitutes = true;
        fallback = true;
      };
    };
  };
}
