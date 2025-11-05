{
  flake.modules.nixos.libvirt = { inputs, ...}: {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = [ "sh4k0" ];
    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };
    home-manager.users.sh4k0 = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      };
    };
  };
}
