{ pkgs }:

pkgs.writeShellScriptBin "xmage-sway" ''
  _JAVA_AWT_WM_NONREPARENTING=1 xmage
''
