# nixcfg

Configuration files for my NixOS-based infrastructure (very much a work in progress :hammer_and_wrench:).

## Installation runbook

1. Generate the installer ISO image:
```
nix build github:sh4k0/nixcfg#nixosConfigurations.installer.config.system.build.isoImage
```
