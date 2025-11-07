{
  flake.modules.nixos.host_elysium = { lib, ... }: {
    disko.devices = {
      disk = {
        ssd = {
          type = "disk";
          device = lib.mkDefault "/dev/disk/by-id/ata-CT480BX500SSD1_2126E5B45555";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                label = "boot";
                name = "ESP";
                size = "512M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [
                    "defaults"
                  ];
                };
              };
              luks = {
                size = "100%";
                label = "luks";
                content = {
                  type = "luks";
                  name = "cryptroot";
                  extraOpenArgs = [
                    "--allow-discards"
                    "--perf-no_read_workqueue"
                    "--perf-no_write_workqueue"
                  ];
                  # https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
                  settings = {
                    crypttabExtraOpts = [
                      "fido2-device=auto"
                      "token-timeout=10"
                    ];
                  };
                  content = {
                    type = "zfs";
                    pool = "rpool";
                  };
                };
              };
            };
          };
        };
      };
      zpool = {
        rpool = {
          type = "zpool";
          options = {
            ashift = "12";
            autotrim = "on";
            compatibility = "grub2";
          };
          rootFsOptions = {
            acltype = "posixacl";
            canmount = "off";
            compression = "lz4";
            devices = "off";
            normalization = "formD";
            relatime = "on";
            xattr = "sa";
            "com.sun:auto-snapshot" = "false";
          };
          mountpoint = "/boot";
          datasets = {
            nixos = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "nixos/root" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/boot";
            };
          };
        };
      };
    fileSystems."/persist".neededForBoot = true;
    fileSystems."/var/log".neededForBoot = true;
  };
}
