{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../applications/helix.nix
    ../applications/git.nix
    ../applications/jj.nix
    ../applications/bat.nix
    ../applications/eza.nix
    ../applications/lsp.nix
    ../applications/vscode.nix
    ../applications/discord.nix
    ../applications/openconnect.nix
    ../applications/duckdb.nix
    ../applications/wireshark.nix
    ../applications/7zip.nix
    ../applications/awscli.nix
    ../applications/zed.nix
    ../modules/terminal
    ../modules/desktop
    ../modules/kubedev
    ../modules/python
    ../modules/rust
    ../modules/julia
    ../modules/cdev
    ../modules/lean
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
    pkgs.wget
    pkgs.jq
    pkgs.yt-dlp
  ];

  programs.home-manager.enable = true;

  home.persistence."/persist/home/bradyn" = {
    directories = [
      "Documents"
      ".ssh"
      ".config/discord"
      ".cache/flatpak"
      ".local/share/flatpak"
      ".var/app/com.valvesoftware.Steam"
    ];
    allowOther = true;
  };
}
