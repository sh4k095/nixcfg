{
  pkgs,
  ...
}: {
      gtk = {
        enable = true;
        font = {
          name = "JetBrainsMonoNLNerdFontMono";
          size = 11;
        };
        theme = {
          name = "Breeze-Dark";
          package = pkgs.kdePackages.breeze-gtk;
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
          name = "breeze_cursors";
          size = 24;
        };
        gtk2 = {
          extraConfig = ''
            gtk-menu-images = 0;
            gtk-button-images = 0;
            gtk-xft-antialias = 1;
            gtk-xft-hinting = 1;
            gtk-xft-hintstyle = "hintslight";
            gtk-xft-rgba = "none";
            gtk-xft-dpi = 98304;
          '';
        };
        gtk3 = {
          extraConfig = {
            gtk-application-prefer-dark-theme = "true";
            gtk-xft-antialias = 1;
            gtk-xft-hinting = 1;
            gtk-xft-hintstyle = "hintslight";
            gtk-xft-rgba = "none";
            gtk-xft-dpi = 98304;
            gtk-overlay-scrolling = "true";
            gtk-key-theme-name = "Default";
            gtk-menu-images = "false";
            gtk-button-images = "false";
          };
          extraCss = ''
          .titlebar,
          .titlebar .background
          {
            border-radius: 0;
          }

          decoration
          {
            box-shadow: none;
          }

          decoration:backdrop
          {
            box-shadow: none;
          }
          '';
        };
        gtk4 = {
          extraConfig = {
            gtk-application-prefer-dark-theme = "true";
            gtk-xft-antialias = 1;
            gtk-xft-hinting = 1;
            gtk-xft-hintstyle = "hintslight";
            gtk-xft-rgba = "none";
            gtk-xft-dpi = 98304;
            gtk-overlay-scrolling = "true";
          };
          extraCss = ''
          .titlebar,
          .titlebar .background
          {
            border-radius: 0;
          }

          decoration
          {
            box-shadow: none;
          }

          decoration:backdrop
          {
            box-shadow: none;
          }
          '';
        };
      };
}
