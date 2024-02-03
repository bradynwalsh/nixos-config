{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    xfce.thunar
  ];
}
