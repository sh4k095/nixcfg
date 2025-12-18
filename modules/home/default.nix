{ config, ... }: {
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      firefox
      nh
      sway
      waybar
      xdg
    ];
  };
}
