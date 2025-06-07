{ config, lib, pkgs, ... }:

{
  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Bradyn Walsh";
        email = "bradyn.walsh@gmail.com";
      };
    };
  };
}
