{ config, lib, pkgs, ... }:

{
  # Use NetworkManager
  networking.networkmanager.enable = true;

  environment.persistence."/persist/networking" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
    ];
  };
}
