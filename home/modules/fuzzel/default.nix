{pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMonoNLNerdFontMono:size=10";
        use-bold = false;
        prompt = "'🔎 '";
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
      colors = {
        background = "282828dd";
        text = "ebdbb2ff";
        prompt = "fe8019ff";
# placeholder=93a1a1ff
        input = "fe8019ff";
        match = "fe8019ff";
        selection = "fe8019ff";
        selection-text = "282828ff";
        selection-match = "928374ff";
        counter = "93a1a1ff";
        border = "282828dd";
      };
    };
  };
}
