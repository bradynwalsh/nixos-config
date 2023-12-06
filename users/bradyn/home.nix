{ config, lib, pkgs, ... }:

{
  home.username = "bradyn";
  home.homeDirectory = "/home/bradyn";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
  ];
}
