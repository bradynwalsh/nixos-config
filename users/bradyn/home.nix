{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../applications/helix.nix
    ../applications/git.nix
    ../applications/bat.nix
    ../applications/eza.nix
    ../applications/lsp.nix
    ../applications/vscode.nix
    ../applications/discord.nix
    ../applications/beekeeper.nix
    ../modules/terminal
    ../modules/desktop
    ../modules/kubedev
    ../modules/python
    ../modules/rust
  ];

  home.username = "bradyn";
  home.homeDirectory = "/home/bradyn";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.btop
    pkgs.htop
    pkgs.glances
    pkgs.fd
    pkgs.fzf
    pkgs.yt-dlp
  ];

  programs.home-manager.enable = true;

  home.persistence."/persist/home/bradyn" = {
    directories = [
      "Documents"
      ".ssh"
      ".config/discord"
    ];
    allowOther = true;
  };
}
