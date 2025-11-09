{
  flake.modules.nixos.host_elysium = { config, ... }:
  let
    diskMain = "/dev/disk/by-id/ata-CT480BX500SSD1_2126E5B45555";
  in
  {
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "${diskMain}";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                priority = 1;
                name = "ESP";
                start = "1M";
                end = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              rpool = {
                size = "100%";
                content = {
                  type = "zfs";
                  pool = "rpool";
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
          };
          rootFsOptions = {
            acltype = "posixacl";
            canmount = "off";
            compression = "zstd";
            dnodesize = "auto";
            normalization = "formD";
            relatime = "on";
            xattr = "sa";
            "com.sun:auto-snapshot" = "false";
          };
          mountpoint = "/";
          datasets = {
            nixos = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "nixos/var" = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "nixos/empty" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/";
              postCreateHook = "zfs snapshot rpool/nixos/empty@start";
            };
            "nixos/home" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/home";
            };
            "nixos/var/log" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/var/log";
            };
            "nixos/var/lib" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/var/lib";
            };
            "nixos/config" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/etc/nixos";
            };
            "nixos/persist" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/persist";
            };
            "nixos/nix" = {
              type = "zfs_fs";
              options.mountpoint = "legacy";
              mountpoint = "/nix";
            };
          };
        };
      };
    };
  };
}
