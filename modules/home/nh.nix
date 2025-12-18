{
  flake.modules.homeManager.nh = { nhSwitchCommand, ... }: {
    home.shellAliases = {
      u = nhSwitchCommand;
    };

    programs.nh = {
      enable = true;
      flake = "github:sh4k095/nixcfg&ref=dendritic";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 1 --keep-since 8d";
      };
    };
  };
}
