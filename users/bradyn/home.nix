{ config, lib, pkgs, ... }:

{
  imports = [
    ../applications/helix.nix
    ../applications/git.nix
    ../applications/lsp.nix
    ../modules/desktop
  ];

  home.username = "bradyn";
  home.homeDirectory = "/home/bradyn";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
  ];

  programs.home-manager.enable = true;
}
