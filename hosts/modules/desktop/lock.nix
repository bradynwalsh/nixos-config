{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.swaylock
  ];

  security.pam.services.swaylock = {
    fprintAuth = true;
  };
}
