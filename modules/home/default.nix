{ config, ... }: {
  flake.modules.homeManager.core = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      firefox
      bat
      nh
      sway
      waybar
      xdg
    ];
  };
}
