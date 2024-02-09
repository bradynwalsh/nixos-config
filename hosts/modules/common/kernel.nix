{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableRedistributableFirmware = true;

  # Enable Virtualisation
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  virtualisation.libvirtd.enable = true;
}
