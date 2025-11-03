{
  flake.modules.nixos.mittelab = { inputs, config, lib, pkgs, ...}:
    let
      secretspath = builtins.toString inputs.nixcfg-secrets;
    in
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];
      
      sops = {
        age.sshKeyPaths = [ "/etc/ssh/erebus_ed25519" ];
        defaultSopsFile = "${secretspath}/hosts/erebus/secrets.yaml";
        secrets = {
          "mittelab/inoc-vpn-env" = {};
          "mittelab/members-wifi-env" = {};
        };
      };
    
      environment.systemPackages =
        let
          dockform = with pkgs; buildGoModule rec {
            pname = "dockform";
            version = "0.6.0";
            src = fetchFromGitHub {
              owner = "gcstr";
              repo = pname;
              rev = "v${version}";
              hash = "sha256-p3dMRI/7KisJv31rXLPs7dtEk/U+rlWaFMJAcDy0ufk=";
            };
            vendorHash = "sha256-gihQfXmVJSTArV+YOlYKEFOvNmCd75SLsK8pIo+FKvs=";
            subPackages = "cmd/dockform";
            ldflags = [
              "-s -w"
              "-X github.com/gcstr/dockform/internal/cli.version=${version}"
            ];
          };
        in [
          dockform
        ];
      
      networking.networkmanager = {
        ensureProfiles = {
          environmentFiles = [
            config.sops.secrets."mittelab/inoc-vpn-env".path
            config.sops.secrets."mittelab/members-wifi-env".path
          ];
          profiles = {
            iNOC-vpn = {
              connection = {
                id = "mittelab";
                interface-name = "mittelab";
                type = "wireguard";
                uuid = "948271ef-cf6e-40e3-be56-25a420b69d31";
                autoconnect = false;
              };
              ipv4 = {
                address1 = "10.242.42.2/32";
                dns = "10.42.77.253;10.42.77.252;";
                dns-search = "~;";
                method = "manual";
              };
              ipv6 = {
                addr-gen-mode = "default";
                method = "disabled";
              };
              proxy = { };
              wireguard = {
                private-key = "$WG_PRIVATE_KEY";
              };
              "wireguard-peer.c49rv8ZVw67xuBnxEK3fg/cGrDD6y0ibIZjIlb2vxTs=" = {
                allowed-ips = "10.242.42.0/24;10.42.77.0/24;10.42.88.0/24;10.42.132.0/24;192.168.4.0/24;192.168.88.0/24;10.42.10.0/24;";
                endpoint = "vpn.mittelab.org:13231";
                persistent-keepalive = "25";
              };
            };
            Mittelab_Members_Legacy = {
              connection = {
                id = "Mittelab_Members_Legacy";
                interface-name = "wlp3s0";
                type = "wifi";
                uuid = "f23c84f2-6b25-46b3-b818-257098b04fdb";
              };
              ipv4 = {
                method = "auto";
              };
              ipv6 = {
                addr-gen-mode = "default";
                method = "auto";
              };
              proxy = { };
              wifi = {
                mode = "infrastructure";
                ssid = "Mittelab_Members_Legacy";
              };
              wifi-security = {
                auth-alg = "open";
                key-mgmt = "wpa-psk";
                psk = "$MEMBERS_WIFI_PASSWORD";
              };
            };
          };
        };
      };
    };
}
