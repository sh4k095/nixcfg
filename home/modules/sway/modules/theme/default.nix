{ config, ... }

let
  col_focused = "#FE8019";
  col_focused_inactive = "#B57614";
  col_unfocused = "#A89984";
  col_text_dark = "#1D2021";
  col_text_light = "#BDAE93";
  col_urgent = "#CC241D";
  col_unfocused_border = "#3C3836";
in
  {
    config.wayland.windowManager.sway.config.colors = {
      focused = {
        background = ${col_focused};
        border = ${col_foc};
        background = ${col_focused};
        background = ${col_focused};
        background = ${col_focused};
      };
    };
  }
