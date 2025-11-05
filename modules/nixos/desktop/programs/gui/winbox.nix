{
  flake.modules.nixos.winbox = { pkgs, lib, ... }: {
    programs.winbox = {
      enable = true;
      package = lib.mkForce pkgs.winbox4;
      openFirewall = false;
    };
    
    # setting the Qt backend to XCB to allow WinBox to run under Wayland
    nixpkgs.overlays = [
      (final: prev: {
        winbox4 = prev.winbox4.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
            wrapProgram $out/bin/WinBox --set QT_QPA_PLATFORM xcb
          '';
        });
      })
    ];
  };
}
