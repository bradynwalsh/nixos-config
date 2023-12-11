{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.bradyn = {
      extensions = with inputs.firefox-addons; [
        ublock-origin
      ];
    };
  };
}