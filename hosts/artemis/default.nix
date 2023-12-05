{ config, lib, pkgs, ... }:

{
  imports = [
    ./disks.nix
    ../modules/desktop
  ];

  networking.hostname = "artemis";

  system.stateVersion = "23.11";
}
