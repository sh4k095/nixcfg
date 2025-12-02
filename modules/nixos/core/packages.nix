{
  flake.modules.nixos.core = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dua
      fd
      file
      git
      killall
      ncdu
      ripgrep
      tmux
      tree
      unzip
      wget
      zip
      zsh
      dig
      dog
      lsof
      btop
      htop
      # systemd-manager-tui
    ];
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
