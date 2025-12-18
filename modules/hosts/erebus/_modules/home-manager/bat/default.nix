{ lib, config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
    config = {
      italic-text = "always";
      style = "numbers,changes,header,grid";
      theme = "gruvbox-dark";
      tabs = "2";
      paging = "auto";
    };
  };
}
