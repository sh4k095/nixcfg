{
  flake.modules.nixos.host_erebus = { inputs, config, ... }: let
    secretspath = builtins.toString inputs.nixcfg-secrets;
  in {
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/erebus_ed25519" ];
      defaultSopsFile = "${secretspath}/hosts/erebus/secrets.yaml";
      secrets = {
        "passwords/sh4k0" = { neededForUsers = true; };
        "passwords/root" = { neededForUsers = true; };
      };
    };
    users.users.sh4k0.hashedPasswordFile = config.sops.secrets."passwords/sh4k0".path;
    users.users.root.hashedPasswordFile = config.sops.secrets."passwords/root".path;
  };
}
