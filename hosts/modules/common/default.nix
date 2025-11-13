{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./kernel.nix
    ./boot.nix
    ./time.nix
    ./corePackages.nix
    ./fwupd.nix
    ./impermanence.nix
    ./ssh.nix
    ./secrets.nix
    ./podman.nix
    ./pam.nix
    ./clamav.nix
  ];

  programs.nix-ld.enable = true;
}
