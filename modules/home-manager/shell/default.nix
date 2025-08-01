{ lib, config, pkgs, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "enables shell configuration";
  };
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      shellAliases = {
        "cat" = "bat";
        "diff" = "batdiff";
        "grep" = "rg";
        "ip" = "ip -c";
        "la" = "eza -al";
        "less" = "bat";
        "ll" = "eza -l";
        "ls" = "eza";
        "man" = "batman";
        "tree" = "eza -T";
        "yz" = "yazi";
        "z" = "zoxide";
        "zj" = "zellij";
      };
      initContent = ''
        function y() {
        	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        	yazi "$@" --cwd-file="$tmp"
        	IFS= read -r -d \'\' cwd < "$tmp"
        	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        	rm -f -- "$tmp"
        }
        eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
        eval "$(direnv hook zsh)"
      '';
      oh-my-zsh = {
        enable = true;
        theme = "nicoulaj";
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
