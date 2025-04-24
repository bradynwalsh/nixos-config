{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        userSettings = {
          "window.menuBarVisibility" = "toggle";
        };

        extensions = [
          pkgs.vscode-extensions.bbenoist.nix
          pkgs.vscode-extensions.tomoki1207.pdf
          pkgs.vscode-extensions.redhat.vscode-yaml
          pkgs.vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
          pkgs.vscode-extensions.ms-vscode-remote.remote-containers
        ];
      };
    };
  };
}
