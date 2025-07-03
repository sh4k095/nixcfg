{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = [ 
    "amdgpu"
    "nvidia"
  ];
  
  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
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
}
