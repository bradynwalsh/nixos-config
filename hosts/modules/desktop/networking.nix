{ config, lib, pkgs, ... }:

{
  # Use NetworkManager
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;

  environment.persistence."/persist/networking" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
    ];
  };
}
