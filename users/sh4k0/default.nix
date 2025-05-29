{ ... }:

{
  users.users.sh4k0 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "seat" "networkmanager" ];
  };
}
