{
  wayland.windowManager.sway.config = {
    floating = {
      criteria = [
        { app_id = "btop"; }
        { app_id = "nm-connection-editor"; }
        { app_id = "nmtui"; }
        { app_id = "ovito"; }
        { app_id = "pavucontrol"; }
        { app_id = "calculator"; }
        { app_id = "org.kde.dolphin"; }
        { class = "Electron"; }
      ];
    };
    window = {
      commands = [
        {
          command = ''
            {
              floating enable
              resize set 100ppt 40ppt
              move position 0 0
              move to scratchpad
              scratchpad show
            }
            '';
          criteria = {
            app_id = "dropdown-terminal";
          };
        }
        {
          command = ''
            {
              fullscreen
              inhibit_idle
            }
            '';
          criteria = {
            app_id = "mpv";
          };
        }
        {
          command = ''
            {
              fullscreen
              inhibit_idle
            }
            '';
          criteria = {
            app_id = "steam";
          };
        }
        {
          command = ''
            {
              floating enable
              resize set 40ppt 60ppt
            }
            '';
          criteria = {
            app_id = "floaterm";
          };
        }
      ];
    };
  };
}
