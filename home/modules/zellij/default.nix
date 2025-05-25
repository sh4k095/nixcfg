{ lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = lib.mkOptionDefault {
      theme = "gruvbox-dark";
    };
  };
}
