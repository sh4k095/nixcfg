{ config, lib, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = lib.mkForce false;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };
  
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866-part1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/" = {
      device = "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866-part2";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" ];
    };
    "/home" = {
      device = "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866-part2";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };
    "/var/log" = {
      device = "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866-part2";
      fsType = "btrfs";
      options = [ "subvol=@var_log" "compress=zstd" ];
    };
    "/.snapshots" = {
      device = "/dev/disk/by-id/ata-SAMSUNG_MZ7LN256HCHP-000L7_S20HNXAH227866-part2";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" "compress=zstd" ];
    };
    "/data" = {
      device = "/dev/disk/by-id/ata-HGST_HTS721010A9E630_JR10006P1DJTPF-part1";
      fsType = "btrfs";
      options = [ "compress=zstd" ];
    };
  };
}
