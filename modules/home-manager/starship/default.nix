{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$character";
      right_format = "$all";
      directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      git_branch.symbol = " ";
      git_commit.tag_symbol = "  ";
      kubernetes.symbol = " ";
      golang.symbol = " ";
      haskell.symbol = " ";
      hostname.format = "@[$hostname]($style) ";
      nix_shell.symbol = " ";
      python.symbol = " ";
      rust.symbol = "󱘗 ";
      username.format = "[$user]($style) ";
    };
  };
}
