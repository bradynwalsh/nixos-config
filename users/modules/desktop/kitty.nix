{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    themeFile = "Nord";
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
  };
}
