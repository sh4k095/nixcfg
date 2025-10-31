{ pkgs, config, lib, ... }:

{
  options = {
    sway = {
      enable = lib.mkEnableOption "sway";
      withXWayland = lib.mkOption {
        type = lib.types.bool;
        description = ''
          Whether to enable XWayland.
        '';
      };
      withNvidiaGPU = lib.mkOption {
        type = lib.types.bool;
        description = ''
          Whether the host has an Nvidia GPU.

          Ensures sway is launched properly with the
          "--unsupported-gpu" flag.
        '';
      };
    };
  };
  config = lib.mkIf config.sway.enable {
    programs.sway = {
      enable = true;
      xwayland.enable = config.sway.withXWayland;
      extraOptions = if config.sway.withNvidiaGPU then
        [ "--unsupported-gpu" ]
      else
        [];
      extraPackages = with pkgs; [ 
        swappy
        swayidle
      ];
    };
  };
}
