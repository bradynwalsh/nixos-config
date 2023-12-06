{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./disks.nix
    ../modules/common
    ../modules/desktop
  ];

  networking.hostName = "artemis";

  system.stateVersion = "23.11";
}
