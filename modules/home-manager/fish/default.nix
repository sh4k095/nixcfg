{ lib, config, pkgs, ... }:

let
  shell_aliases = import ./aliases.nix;
  shell_functions = import ./functions.nix;
  cfg = config.fish;
in
{
  options = {
    fish.enable = lib.mkEnableOption "Enable fish configuration";
  };
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAliases = shell_aliases.aliases;
      #shellInitLast = shell_functions.functions;
      plugins = [
        {
          name = "z";
          src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "z";
            rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
            sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
          };
        }
      ];
    };
  };
}
