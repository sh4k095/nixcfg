{
  flake.modules.nixos.host_erebus = { inputs, config, ... }: let
    secretspath = builtins.toString inputs.nixcfg-secrets;
  in {
    imports = [ inputs.sops-nix.nixosModules.sops ];
    
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/erebus_ed25519" ];
      defaultSopsFile = "${secretspath}/hosts/erebus/secrets.yaml";
      secrets = {
        "passwords/sh4k0" = { neededForUsers = true; };
      };
    };

    users.users.sh4k0.hashedPasswordFile = config.sops.secrets."passwords/sh4k0".path;
  };
}
