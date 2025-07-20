{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [
      "~/.ssh/ssh_hosts"
    ];
    #matchBlocks = {
    #  "gitlab.com" = {
    #    identityFile = "~/.ssh/gitlab";
    #  };
    #  "github.com" = {
    #    identityFile = "~/.ssh/github";
    #  };
    #  "vsc4" = {
    #    hostname = "vsc4.vsc.ac.at";
    #    user = "cpaulett";
    #  };
    #  "vsc5" = {
    #    hostname = "vsc5.vsc.ac.at";
    #    user = "cpaulett";
    #  };
    #};
  };
}
