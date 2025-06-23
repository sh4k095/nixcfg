{ pkgs, ... }:

{
  users.users.sh4k0 = {
    isNormalUser = true;
    extraGroups = [
      "adbusers"
      "audio"
      "bluetooth"
      "dialout"
      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  home-manager.users.sh4k0 = {
    programs.zsh = {
      enable = true;
      shellAliases = {
        "ip" = "ip -c";
        "cat" = "bat";
        "grep" = "rg";
        "ls" = "eza";
        "ll" = "eza -l";
        "tree" = "eza -T";
      };
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
