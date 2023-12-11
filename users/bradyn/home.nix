{ config, lib, pkgs, ... }:

{
  imports = [
    ../applications/firefox.nix
    ../applications/helix.nix
  ];

  home.username = "bradyn";
  home.homeDirectory = "/home/bradyn";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
  ];

  programs.home-manager.enable = true;
}
