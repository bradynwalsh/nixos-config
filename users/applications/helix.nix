{ config, lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "nord";
    };
  };
}
