{
  imports = [ ./colorschemes/gruvbox.nix ];
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
      terminal = {
        shell = {
          program = "zellij";
          args = [
            "-l"
            "welcome"
          ];
        };
      };
    };
  };
}
