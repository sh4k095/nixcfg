{ lib, config, pkgs, ... }:

let
  shell_aliases = import ./modules/aliases.nix;
  shell_functions = import ./modules/functions.nix;
  cfg = config.zsh;
in
{
  options = {
    zsh.enable = lib.mkEnableOption "Enable zsh configuration";
  };
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      shellAliases = shell_aliases.aliases;
      initContent = shell_functions.functions;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "colorize"
          "git"
          "rsync"
          "ssh-agent"
          "sudo"
          "wd"
          "zoxide"
        ];
      };
      autosuggestion.enable = true;
    };
  };
}
