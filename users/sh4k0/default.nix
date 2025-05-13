
{ ... }:

{
  users.users.sh4k0 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "seat" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}
