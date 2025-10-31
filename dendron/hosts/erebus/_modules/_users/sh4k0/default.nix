{ pkgs, ... }:

{
  nix.settings.trusted-users = [ "sh4k0" ];
  
  users = {
    users = {
      sh4k0 = {
        shell = pkgs.zsh;
        uid = 1000;
        isNormalUser = true;
        extraGroups = [
          "adbusers"
          "audio"
          "bluetooth"
          "dialout"
          "input"
          "networkmanager"
          "video"
          "wheel"
        ];
        group = "sh4k0";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO2Yr/kP45KafIBopwolJ9bqpIlHUZSbbmIefu6PuVQd sh4k0@erebus"
        ];
      };
    };
    groups = {
      sh4k0 = {
        gid = 1000;
      };
    };
  };
  programs.zsh.enable = true;
}
