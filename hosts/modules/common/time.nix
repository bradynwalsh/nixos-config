{ config, lib, pkgs, ... }:

{
  # Use chronyd instead of systemd-timesyncd
  services.chrony.enable = true;
  services.timesyncd.enable = false;

  # Automatic timezone sync
  services.automatic-timezoned.enable = true;
}
