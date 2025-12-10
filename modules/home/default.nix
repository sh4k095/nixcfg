{
  flake.modules.homeManager.core = { inputs, config, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      (
        with config.flake.modules.homeManager; [
          firefox
        ]
      )
    ];
    #home-manager.users.sh4k0 = {
    #  xdg.mimeApps = {
    #    enable = true;
    #    defaultApplications = {
    #      "text/html" = "firefox.desktop";
    #      "x-scheme-handler/http" = "librewolf.desktop";
    #      "x-scheme-handler/https" = "librewolf.desktop";
    #      "x-scheme-handler/about" = "librewolf.desktop";
    #      "x-scheme-handler/unknown" = "librewolf.desktop";
    #    };
    #  };
    #};
  };
}
