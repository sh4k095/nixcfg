{
  flake.modules.nixos.android =
    { pkgs, ... }:
    {
      programs.adb.enable = true;
      environment.systemPackages = with pkgs; [
        jmtpfs
      ];
      users.users.sh4k0.extraGroups = [ "adbusers" ];
    };
}
