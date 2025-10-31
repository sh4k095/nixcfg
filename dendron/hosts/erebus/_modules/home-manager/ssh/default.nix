{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [
      "config.d/ssh_hosts"
    ];
  };
}
