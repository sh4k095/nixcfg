{
  programs.ssh = {
    enable = true;
    addKeysToAgent = true;
    matchBlocks = {
      "vsc4" = {
        hostname = "vsc4.vsc.ac.at";
        user = "cpaulett";
      };
      "vsc5" = {
        hostname = "vsc5.vsc.ac.at";
        user = "cpaulett";
      };
    };
  };
}
