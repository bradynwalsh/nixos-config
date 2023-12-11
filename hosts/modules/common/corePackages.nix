{ config, lib, pkgs, ... }:

{
  programs.git.enable = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = [

  ];
}
