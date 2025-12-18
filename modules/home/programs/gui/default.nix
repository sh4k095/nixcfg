{ config, ... }: {
  flake.modules.homeManager.gui = {
    imports = with config.flake.modules.homeManager; [
      firefox
    ];
  };
}
