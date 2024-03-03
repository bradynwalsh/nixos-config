{ config, lib, pkgs, ... }:

{
  # Make helix the default editor
  home.sessionVariables.EDITOR = "hx";

  programs.helix = {
    enable = true;

    settings = {
      theme = "nord";
    };
  };
}
