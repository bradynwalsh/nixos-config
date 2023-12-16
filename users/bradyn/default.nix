{ config, lib, pkgs, ... }:

{
  users.users.bradyn = {
    initialPassword = "correcthorsebatterystaple";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
