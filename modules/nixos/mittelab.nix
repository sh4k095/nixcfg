{ inputs, config, lib, ...}:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/erebus_ed25519" ];
    defaultSopsFile = ../../secrets/hosts/erebus/secrets.yaml;
    secrets = {
      "wireguard/mittelab/privatekey" = {};
    };
  };
  
  networking = {
    wg-quick.interfaces = {
      mittelab = {
        address = [ "10.242.42.2/32" ];
        dns = [
          "10.42.77.253"
          "10.42.77.252"
        ];
        privateKeyFile = config.sops.secrets."wireguard/mittelab/privatekey".path;
        peers = [
          {
            publicKey = "c49rv8ZVw67xuBnxEK3fg/cGrDD6y0ibIZjIlb2vxTs=";
            allowedIPs = [
              "10.242.42.0/24"
              "10.42.77.0/24"
              "10.42.88.0/24"
              "10.42.132.0/24"
              "192.168.4.0/24"
              "192.168.88.0/24"
              "10.42.10.0/24"
            ];
            endpoint = "vpn.mittelab.org:13231";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
  # Prevent Mittelab VPN from starting on boot
  systemd.services.wg-quick-mittelab.wantedBy = lib.mkForce [];
}
