{ config, lib, pkgs, ... }:

{
  programs.git.enable = true;
  programs.ssh.startAgent = true;
  programs.fish.enable = true;

  environment.systemPackages = [
    pkgs.ripgrep
  ];

  users.defaultUserShell = pkgs.fish;
}
