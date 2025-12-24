{
  flake.modules.homeManager.shell = { lib, config, pkgs, ... }:
    let
      shell_aliases = import ./_aliases.nix;
      shell_functions = import ./_functions.nix;
    in {
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
          "vi-mode"
          "wd"
          "zoxide"
        ];
      };
      autosuggestion.enable = true;
      history = {
        expireDuplicatesFirst = true;
        extended = true;
        findNoDups = true;
        ignoreAllDups = true;
      };
    };
  };
}
