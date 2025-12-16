{
  flake.modules.homeManager.sway = { config, pkgs, ... }: {

    config.wayland.windowManager.sway.config.modes = {

      # Resize mode
      resize = {

        # Resize elements
        left = "resize shrink width 10 px";
        down = "resize grow height 10 px";
        up = "resize shrink height 10 px";
        right = "resize grow width 10 px";

        # Return to default mode
        Return = "mode default";
        Escape = "mode default";
      };

      present = {

        # Presentation mode
        m = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present mirror";
        
        # Modify an already running mirroring window
        o = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present set-output";
        r = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present set-region";
        "Shift+r" = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present unset-region";
        f = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present toggle-freeze";
        #s = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present set-scaling";
        #c = "mode default; exec ${pkgs.wl-mirror}/bin/wl-present custom";
        
        # Return to default mode
        Return = "mode default";
        Escape = "mode default";
      };
    };
  };
}
