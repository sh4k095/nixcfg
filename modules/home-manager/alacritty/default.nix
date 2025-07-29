{
  lib,
  config,
  pkgs,
  ...
}: {
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
        colors = let
          c = config.easyScheme.colors;
        in {
          primary = {
            background = "${c.background}";
            foreground = "${c.foreground}";
          };
          normal = {
            black = "${c.black}";
            red = "${c.red}";
            green = "${c.green}";
            yellow = "${c.yellow}";
            blue = "${c.blue}";
            magenta = "${c.magenta}";
            cyan = "${c.cyan}";
            white = "${c.white}";
          };
          bright = {
            black = "${c.brightBlack}";
            red = "${c.brightRed}";
            green = "${c.brightGreen}";
            yellow = "${c.brightYellow}";
            blue = "${c.brightBlue}";
            magenta = "${c.brightMagenta}";
            cyan = "${c.brightCyan}";
            white = "${c.brightWhite}";
          };
        };
      };
    };
  };
}
