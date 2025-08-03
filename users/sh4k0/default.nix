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
}
