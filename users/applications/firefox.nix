{ config, lib, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.bradyn = {
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
      ];
    };
  };
}