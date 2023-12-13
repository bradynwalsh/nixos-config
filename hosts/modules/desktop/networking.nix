{ config, lib, pkgs, ... }:

{
  # Enable Wi-Fi
  networking.wireless.enable = true;
  networking.wireless.dbusControlled = true;
  networking.wireless.userControlled.enable = true;

  # Use NetworkManager
  networking.networkmanager.enable = true;
}
