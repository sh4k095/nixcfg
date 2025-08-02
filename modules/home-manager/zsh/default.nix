{ lib, config, pkgs, ... }:

let
  shell_aliases = import ./aliases.nix;
  shell_functions = import ./functions.nix;
  cfg = config.shellConfig;
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
