{
  flake.modules.homeManager.waybar = { lib, config, pkgs, ... }: {
    services = {
      blueman-applet.enable = true;
      network-manager-applet.enable = true;
    };
    programs.waybar = {
      enable = true;

      settings.main = {
        layer = "top";
        position = "top";
        height = 12;
        #fixed-center = false;
        modules-left = [
          "sway/workspaces"
          "sway/scratchpad"
          "custom/launcher"
          "cpu"
          "temperature"
          "memory"
          "disk#root"
        ];
        modules-center = [
          "clock"
          "custom/weather"
        ];
        modules-right = [
          "idle_inhibitor"
          "backlight"
          "wireplumber#source"
          "wireplumber#sink"
          "network#interface"
          "network#band_up"
          "network#band_down"
          "battery"
          "custom/power"
          #"custom/notifs"
          #"custom/spotify"
          "tray"
        ];
      };
      style = builtins.readFile ./style.css;
    };
  };
}
