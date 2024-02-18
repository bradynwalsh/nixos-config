{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./disks.nix
    ../modules/common
    ../modules/desktop
    ../modules/secureboot
    ../modules/tailscale
  ];

  networking.hostName = "artemis";

  system.stateVersion = "23.11";
}
