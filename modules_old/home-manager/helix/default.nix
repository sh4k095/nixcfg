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
      gruvnox-dark-transparent = {
        inherits = "gruvbox-dark";
        "ui.background" = { };
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
