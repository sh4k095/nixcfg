{ config, ... }: {
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      firefox
      noctalia
      packages
      sway
      xdg
    ];
  };
}
