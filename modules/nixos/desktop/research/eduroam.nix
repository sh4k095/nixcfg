{
  flake.modules.nixos.eduroam = { inputs, config, ... }: {

    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    sops = {
      secrets = {
        "eduroam/account-env" = {};
        "eduroam/password-env" = {};
        "eduroam/certificate" = {};
      };
    };

    networking.networkmanager = {
      ensureProfiles = {
        environmentFiles = [
          config.sops.secrets."eduroam/account-env".path
          config.sops.secrets."eduroam/password-env".path
        ];
        profiles = {
          eduroam = {
            connection = {
              id = "eduroam";
              type = "wifi";
              interface-name = "wlp3s0";
            };
            wifi = {
              mode = "infrastructure";
              ssid = "eduroam";
            };
            wifi-security = {
              key-mgmt = "wpa-eap";
            };
            "802-1x" = {
              eap = "peap";
              identity = "$ACCOUNT";
              anonymous-identity = "anonymous@tuwien.ac.at";
              password = "$PASSWORD";
              ca-cert = config.sops.secrets."eduroam/certificate".path;
              phase2-auth = "mschapv2";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              method = "auto";
            };
          };
        };  
      };
    };
  };
}
