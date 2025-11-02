{ lib, config, ... }:

{
  options = {
    zathura.enable = lib.mkEnableOption "";
  };
  
  config = lib.mkIf config.zathura.enable {
    programs.zathura = {
      enable = true;
      options = {
      };
    };
  };
}
