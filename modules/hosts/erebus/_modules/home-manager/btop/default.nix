{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { rocmSupport = true; cudaSupport = true; };
    settings = {
      color_theme = "gruvbox_dark";
      theme_background = false;
      vim_keys = true;
      graph_symbol = "braille";
      proc_tree = true;
    };
  };
}
