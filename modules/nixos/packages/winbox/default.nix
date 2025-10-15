{ pkgs, ... }:

{
  programs.winbox = {
    enable = true;
    package = pkgs.winbox4;
    openFirewall = false;
  };
  # Setting the Qt backend to XCB to allow WinBox to run under Wayland
  nixpkgs.overlays = [
    (final: prev: {
      winbox4 = prev.winbox4.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          wrapProgram $out/bin/WinBox --set QT_QPA_PLATFORM xcb
        '';
      });
    })
  ];
}
