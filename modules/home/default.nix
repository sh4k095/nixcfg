{ config, ... }: {
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      firefox
      sway
      waybar
      xdg
    ];
  };
}
