{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;

  # Persist Machine ID across boots
  environment.persistence."/persist/config/machine-id" = {
    hideMounts = true;

    files = ["/etc/machine-id"];
  };
}
