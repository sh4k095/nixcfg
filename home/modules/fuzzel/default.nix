{pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMonoNLNerdFontMono:size=10";
        use-bold = true;
        prompt = "";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        horizontal-pad = 12;
        vertical-pad = 12;
        inner-pad = 4;
        image-size-ratio = 1;
        layer = "top";
      };
      border = {
        width = 2;
      };
    };
  };
}
