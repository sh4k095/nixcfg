{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName  = "sh4k0";
    userEmail = "carlofedep@gmail.com";
    aliases = {
      br = "branch";
      ci = "commit -m";
      co = "checkout";
      st = "status";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --date=short --graph";
    };
    signing = {
      signByDefault = true;
      key = "F171A1B7D2AFF371DF60EEC792136C40AFB76798";
    };
  };
  programs.lazygit = {
    enable = true;
  };
}
