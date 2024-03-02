{ config, lib, pkgs, ... }:

{
  programs.git.enable = true;
  programs.ssh.startAgent = true;
  programs.fish.enable = true;

  environment.systemPackages = [
    # Nice to have system utilities
    pkgs.ripgrep
    pkgs.unzip

    # Needed for secrets management
    pkgs.sops
    pkgs.age
    pkgs.ssh-to-age
  ];

  users.defaultUserShell = pkgs.fish;
}
