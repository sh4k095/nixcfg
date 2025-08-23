{ lib, ... }:

{
  disko.devices = {
    disk = {
      os = {
        type = "disk";
        device = lib.mkDefault "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866";
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
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                  };
                  "@home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  "@nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                  "@var_log" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/var/log";
                  };
                };
              };
            };
          };
        };
      };
      data = {
        type = "disk";
        device = lib.mkDefault "/dev/disk/by-id/ata-HGST_HTS721010A9E630_JR10006P1DJTPF";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountpoint = "/data";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
            };
          };
        };
      };
    };
  };
}
