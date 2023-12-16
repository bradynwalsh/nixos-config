{ config, lib, pkgs, ... }:

{
  users.users.bradyn = {
    initialPassword = "correcthorsebatterystaple";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  environment.persistence."/persist/home/bradyn" = {
    users.bradyn = {
      directories = [
        { directory = "Documents"; user = "bradyn"; }
        { directory = ".ssh"; user = "bradyn"; mode = "0700"; }
      ];
    };
  };
}
