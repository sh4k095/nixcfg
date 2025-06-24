{pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMonoNLNerdFontMono:size=10";
        use-bold = true;
        dpi-aware = "yes";
        prompt = "'🚀 '";
        terminal = "${pkgs.alacritty}/bin/alacritty -e";
        lines = 18;
        width = 45;
        horizontal-pad = 16;
        vertical-pad = 16;
        inner-pad = 4;
        image-size-ratio = 1;
        layer = "top";
      };
      border = {
        width = 0;
      };
      colors = {
        background = "282828dd";
        text = "ebdbb2ff";
        prompt = "fe8019ff";
        #placeholder = "#504945ff";
        input = "fe8019ff";
        match = "fe8019ff";
        selection = "#504945ff";
        selection-text = "ebdbb2ff";
        selection-match = "fe8019ff";
        counter = "93a1a1ff";
        border = "282828dd";
      };
    };
  };
}
