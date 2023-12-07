{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./disks.nix
    ../modules/common
    ../modules/desktop
    ../modules/secureboot
  ];

  networking.hostName = "artemis";

  system.stateVersion = "23.11";
}
