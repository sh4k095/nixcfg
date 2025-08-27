{ inputs, config, lib, ...}:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  
  sops = {
    age.sshKeyPaths = [ "/home/sh4k0/.ssh/erebus_ed25519" ];
    defaultSopsFile = ../../secrets/hosts/erebus/secrets.yaml;
    secrets = {
      "ssh_hosts/mittelab" = {};
    };
  };
  
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [
      config.sops.secrets."ssh_hpsts/mittelab".path;
    ];
  };
}
