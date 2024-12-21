{ config, lib, pkgs, ... }:

{
  # Use chronyd instead of systemd-timesyncd
  services.chrony.enable = true;
  services.timesyncd.enable = false;

  # Automatic timezone sync
  services.automatic-timezoned.enable = true;

  # Use BeaconDB for geolocation (MLS default has shut down)
  services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

  # Give Geoclue access to NetworkManager (if installed) for more accurate geo-location
  users.users.geoclue.extraGroups = [ "networkmanager" ];
}
