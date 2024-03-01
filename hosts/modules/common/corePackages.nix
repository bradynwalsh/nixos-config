{ config, lib, pkgs, ... }:

{
  programs.git.enable = true;
  programs.ssh.startAgent = true;
  programs.fish.enable = true;

  environment.systemPackages = [
    pkgs.ripgrep
    pkgs.unzip
    pkgs.sops
  ];

  users.defaultUserShell = pkgs.fish;
}
