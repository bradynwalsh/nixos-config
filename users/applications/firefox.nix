{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.bradyn = {
      extensions = with pkgs.inputs.firefox-addons [
        ublock-origin
      ];
    };
  };
}