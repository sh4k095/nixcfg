{ config, ... }: {
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      gui
      bat
      nh
      sway
      waybar
      xdg
    ];
  };
}
