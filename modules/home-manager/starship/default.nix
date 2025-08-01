{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
      directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      git_branch.symbol = " ";
      git_commit.tag_symbol = "  ";
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
