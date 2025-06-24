{ lib, config, pkgs, ... }:

{
  options = {
    alacritty.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 4;
            y = 4;
          };
          decorations = "None";
          opacity = 0.9;
          blur = true;
        };
        font = {
          normal = {
            family = "JetBrainsMonoNLNerdFontMono";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMonoNLNerdFontMono";
            style = "Bold";
          };
          italic = {
            family = "JetBrainsMonoNLNerdFontMono";
            style = "Italic";
          };
          bold_italic = {
            family = "JetBrainsMonoNLNerdFontMono";
            style = "BoldItalic";
          };
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "On";
          };
          blink_timeout = 0;
        };
        mouse = {
          hide_when_typing = true;
        };
        colors = {
          primary = {
            background = "#282828";
            foreground = "#ebdbb2";
          };
          normal = {
            black = "#282828";
            red = "#cc241d";
            green = "#98971a";
            yellow = "#d79921";
            blue = "#458588";
            magenta = "#b16286";
            cyan = "#689d6a";
            white = "#a89984";
          };
          bright = {
            black = "#928374";
            red = "#fb4934";
            green = "#b8bb26";
            yellow = "#fabd2f";
            blue = "#83a598";
            magenta = "#d3869b";
            cyan = "#8ec07c";
            white = "#ebdbb2";
          };
        };
      };
    };
  };
}
