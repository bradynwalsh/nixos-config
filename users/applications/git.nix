{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Bradyn Walsh";
        email = "bradyn.walsh@gmail.com";
      };
     };
  };
}
