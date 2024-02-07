{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "window.menuBarVisibility" = "toggle";
    };

    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.tomoki1207.pdf
    ];
  };
}
