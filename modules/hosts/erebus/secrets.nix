{
  flake.modules.nixos.host_erebus = { inputs, ... }: {

    imports = [ inputs.sops-nix.nixosModules.sops ];
   
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/erebus_ed25519" ];
      defaultSopsFile = let
        secretspath = builtins.toString inputs.nixcfg-secrets;
      in "${secretspath}/hosts/erebus/secrets.yaml";
      secrets = {
        "passwords/sh4k0" = { neededForUsers = true; }; 
      };
    };
  };
}
