{ ... }

boot = {
  loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      enableCryptodisk = true;
    };
  };
  initrd = {
    luks = {
      devices = {
        "cryptroot" = {
          device = "/dev/disk/by-uuid/ad60d70a-147b-4f77-84f0-daad5f89206b";
          keyFile = "/keyfile.bin";
          allowDiscards = true;
        };
      };
    };
    secrets = {
      "keyfile.bin" = "/etc/secrets/initrd/keyfile.bin";
    };
  };
};
