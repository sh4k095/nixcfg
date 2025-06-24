{ lib, config, ... }:

{
  options = {
    zellij.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      settings = lib.mkOptionDefault {
        theme = "gruvbox-dark";
        ui = {
          pane_frames = {
            rounded_corners = true;
            hide_session_name = true;
          };
        };
        show_startup_tips = false;
      };
    };
  };
}
