{ config, lib, pkgs, ... }:

{
  # Use chronyd instead of systemd-timesyncd
  services.chrony.enable = true;
  services.timesyncd.enable = false;
}
