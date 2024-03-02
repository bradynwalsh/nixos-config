# nixos-config

Contains my NixOS system configuration.

Install the configuration with [nixos-anywhere](https://github.com/nix-community/nixos-anywhere), creating a new [disko](https://github.com/nix-community/disko) configuration for each device.

Features of my setup include:
- Secure boot support (Run installation in SecureBoot Setup Mode to automate creation/enrolling of custom PK)
- TPM LUKS Full-disk encryption
- Imperamence
- [Home Manager](https://github.com/nix-community/home-manager) configuration
- Secrets Management with [sops-nix](https://github.com/Mic92/sops-nix) and [age](https://github.com/FiloSottile/age)
