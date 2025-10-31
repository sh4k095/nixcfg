{ config, ... }:

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
        background = "${col_focused}";
        border = "${col_focused}";
        childBorder = "${col_focused}";
        indicator = "${col_focused}";
        text = "${col_text_dark}";
      };
      focusedInactive = {
        background = "${col_focused_inactive}";
        border = "${col_focused_inactive}";
        childBorder = "${col_focused_inactive}";
        indicator = "${col_focused_inactive}";
        text = "${col_text_dark}";
      };
      unfocused = {
        background = "${col_unfocused}";
        border = "${col_unfocused_border}";
        childBorder = "${col_unfocused}";
        indicator = "${col_unfocused}";
        text = "${col_text_light}";
      };
      urgent = {
        background = "${col_urgent}";
        border = "${col_text_dark}";
        childBorder = "${col_urgent}";
        indicator = "${col_urgent}";
        text = "${col_text_dark}";
      };
    };
  }
