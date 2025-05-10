{ config, lib, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop.overrideAttrs (oldAttrs: rec {
      cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [
        "-DBTOP_RSMI_STATIC=ON"
        "-DBTOP_GPU=ON"
      ];
    });
    settings = {
      color_theme = "Default";
      theme_background = false;
      vim_keys = true;
    };
  };
}
