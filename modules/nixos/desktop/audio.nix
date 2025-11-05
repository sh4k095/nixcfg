{
  flake.modules.nixos.audio = { pkgs, ...}: {
    services.pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    users.users.sh4k0.extraGroups = [ "audio" ];
    environment.systemPackages = with pkgs; [
      alsa-utils
      helvum
      pwvucontrol
    ];
  };
}
