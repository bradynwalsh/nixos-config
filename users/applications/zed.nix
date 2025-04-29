{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extraPackages = with pkgs; [nixd];
    extensions = ["nix"];
  };
}
