{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../applications/helix.nix
    ../applications/git.nix
    ../applications/lsp.nix
    ../applications/vscode.nix
    ../modules/terminal
    ../modules/desktop
  ];

  home.username = "bradyn";
  home.homeDirectory = "/home/bradyn";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.htop
    pkgs.glances
    pkgs.bat
    pkgs.eza
    pkgs.fd
    pkgs.fzf
  ];

  programs.home-manager.enable = true;

  home.persistence."/persist/home/bradyn" = {
    directories = [
      "Documents"
      ".ssh"
    ];
    allowOther = true;
  };
}
