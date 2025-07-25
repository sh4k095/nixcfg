{ pkgs, ... } @ inputs: {

  imports = [
    #../../users/sh4k0
    #...
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPackages = true;
  };

  home = {
    username = "sh4k0";
    homeDirectory = "/home/sh4k0";
    packages = with pkgs; [
      bat
      bottom
      dig
      difftastic
      eza
      fd
      file
      tcpdump
      whois
      zellij
      
    ];
  };
}
