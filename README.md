# nixcfg

Configuration files for my NixOS-based infrastructure (very much a work in progress :hammer_and_wrench:).

## Installation runbook

1. Generate the installer ISO image:
```bash
nix build github:sh4k0/nixcfg#nixosConfigurations.installer.config.system.build.isoImage
```
2. Note the IP address of the installation target:
```bash
ip a
```
3. Deploy the desired configuration using `nixos-anywhere`. Sample bash script to deploy `cetus`:
```bash
#!/usr/bin/env bash

# Create a temporary directory
temp=$(mktemp -d)

# Function to cleanup temporary directory on exit
cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$temp/etc/ssh"

# Decrypt your private key from the password store and copy it to the temporary directory
gopass ssh_keys/cetus  > "$temp/etc/ssh/cetus_ed25519"

# Set the correct permissions so sshd will accept the key
chmod 600 "$temp/etc/ssh/cetus_ed25519"

# Install NixOS to the host system with our secrets
nixos-anywhere \
  --flake ~/.repos/nixcfg#cetus \
  --extra-files "$temp" \
  --target-host root@192.168.88.62 \
  --build-on remote \
  --generate-hardware-config nixos-generate-config ~/.repos/nixcfg/hosts/cetus/hardware-configuration.nix
```
4. Reboot and enjoy your freshly installed system. :)
