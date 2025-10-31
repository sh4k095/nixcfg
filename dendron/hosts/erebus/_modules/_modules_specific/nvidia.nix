{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = [
    "amd"
    "nvidia"
  ];
  
  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      open = true;
      #modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:6:0:0";
      };
    };
  };
  services.udev = {
    extraRules = ''
      SYMLINK=="dri/by-path/pci-0000:01:00.0-card", SYMLINK+="dri/igpu1"
      SYMLINK=="dri/by-path/pci-0000:06:00.0-card", SYMLINK+="dri/dgpu1"
    '';
  };
}
