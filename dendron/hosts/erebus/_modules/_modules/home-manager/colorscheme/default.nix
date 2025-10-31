{ lib, ... }:

with lib; let
  colornames = [
    # Primary colors
    "background"
    "foreground"
    # Normal colors
    "black"
    "red"
    "green"
    "yellow"
    "blue"
    "magenta"
    "cyan"
    "white"
    # Bright colors
    "brightBlack"
    "brightWhite"
    "brightYellow"
    "brightGreen"
    "brightCyan"
    "brightBlue"
    "brightMagenta"
    "brightRed"
  ];
in {
  options.easyScheme = {
    enable = lib.mkEnableOption "easyScheme";
    colors = builtins.listToAttrs (map
    (c: {
      name = c;
      value = mkOption {type = types.str;};
    })
    colornames);
  };
}
