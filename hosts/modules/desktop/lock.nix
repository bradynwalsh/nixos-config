{ config, lib, pkgs, ... }:

{
  security.pam.services.hyprlock = {
    fprintAuth = true;
  };
}
