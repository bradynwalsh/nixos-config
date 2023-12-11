{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Bradyn Walsh";
    userEmail = "bradyn.walsh@gmail.com";
  };
}
