{ config, lib, pkgs, ... }:

{
  users.users.bradyn = {
    initialPassword = "correcthorsebatterystaple";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  environment.persistence."/persist/home/bradyn" = {
    hideMounts = true;

    users.bradyn = {
      directories = [
        "Documents"
        { directory = ".ssh"; mode = "0700"; }
      ];
    };
  };
}
