{ config, lib, pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      editor.soft-wrap = {
        enable = true;
        max-wrap = 25;
        max-indent-retain = 0;
        wrap-indicator = "";
      };
    };
    themes = {
      monokai_pro_transparent = {
        inherits = "monokai_pro";
        "ui.background" = { };
      };
      monokai_pro_light_transparent = {
        inherits = "monokai_pro";
        "ui.background" = { };
        special = "orange";
        module = "orange";
        "variable.parameter" = "orange";
        palette = {
          red = "#e14775";
          orange = "#e16032";
          yellow = "#cc7a0a";
          green = "#269d69";
          blue = "#1c8ca8";
          purple = "#7058be";
          # base colors, sorted from darkest to lightest
          base0 = "#f6f4f4";
          base1 = "#eceae9";
          base2 = "#e3dfde";
          base3 = "#faf4f2";
          base4 = "#bdb4b2";
          base5 = "#a19f91";
          base6 = "#796b67";
          base7 = "#37312f";
          base8 = "#29242a";
          base8x0c = "#e3dfde";
        };
      };
    };
    languages = {
      language-server = {
        pylsp = { command = "pylsp"; };
      };
      language = [
          {
            name = "c";
            indent = { tab-width = 8; unit = "\t"; };
          }
          {
            name = "nix";
            language-servers = [ "nil" ];
          }
          {
            name = "python";
            language-servers = [ "pylsp" ];
          }
        ];
      };
    };
}
