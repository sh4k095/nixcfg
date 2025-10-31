{
  networking.firewall = {
    allowedTCPPorts = [ 53 ];
    allowedUDPPorts = [ 53 ];
  };
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      users = [
        {
          name = "sh4k0";
          # bcrypt-encrypted password
          # generated with:
          # $ nix shell nixpkgs#apacheHttpd --command htpasswd -bnBC 10 '' {PASSWORD} | tr -d ':'
          password = "$2y$10$7Xxj1/2Cg6gqtSbkVtYPOeueDpxKK7Dn7RLzzT5jhEuBjkIHoo9Lu";
        }
      ];
      dns = {
        bind_hosts = [ "0.0.0.0" ];
        bootstrap_dns = [ "9.9.9.9" ];
      };
      querylog = {
        file_enabled = false;
      };
    };
    mutableSettings = false;
  };
}
