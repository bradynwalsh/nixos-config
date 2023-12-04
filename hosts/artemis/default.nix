{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/desktop
  ];

  networking.hostname = "artemis";

  system.stateVersion = "23.11";
}
