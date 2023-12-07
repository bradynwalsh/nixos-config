{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.sbctl
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboot = {
    enable = true;
    pkiBundle = "/usr/share/secureboot";
  };
}
