{ lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
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
}
