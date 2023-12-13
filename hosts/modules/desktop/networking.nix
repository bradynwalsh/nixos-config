{ config, lib, pkgs, ... }:

{
  # Use NetworkManager
  networking.networkmanager.enable = true;
}
