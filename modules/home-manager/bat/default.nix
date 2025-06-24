{ lib, config, pkgs, ... }:

{
  options = {
    bat.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.bat.enable {
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
  };
}
