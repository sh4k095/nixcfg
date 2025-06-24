{ lib, config, pkgs, ... }:

{
  options = {
    zathura.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.zathura.enable {
    programs.zathura = {
      enable = true;
      options = {
        font = "JetBrainsMonoNLNerdFontMono";
        default-bg = "#32302f";
        default-fg = "#d4be98";
        completion-bg = "#32302f";
        completion-fg = "#d4be98";
        completion-group-bg = "#252423";
        completion-group-fg = "#d4be98";
        completion-highlight-bg = "#d4be98";
        completion-highlight-fg = "#32302f";
        inputbar-bg = "#32302f";
        inputbar-fg = "#a9b665";
        statusbar-bg = "#252423";
        statusbar-fg = "#d4be98";
        statusbar-h-padding = 10;
        statusbar-v-padding = 5;
        notification-bg = "#a9b665";
        notification-fg = "#252423";
        notification-error-bg = "#ea6962";
        notification-error-fg = "#252423";
        notification-warning-bg = "#d8a657";
        notification-warning-fg = "#252423";
        highlight-color = "rgba(137,180,130,0.5)";
        highlight-active-color = "rgba(231,138,78,0.5)";
        highlight-fg = "rgba(37,36,35,1)";
        recolor = "true";
        recolor-lightcolor = "#ddc7a1";
        recolor-darkcolor = "#252423";
        recolor-keephue = "true";
        recolor-reverse-video = "true";
      };
    };
  };
}
