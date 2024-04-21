{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./wofi.nix
    ./kitty.nix
    ./firefox.nix
    ./chromium.nix
    ./hyprland.nix
    ./fonts.nix
    ./mako.nix
    ./bar.nix
    ./thunar.nix
    ./bluetooth.nix
    ./kanshi.nix
    ./yubikey.nix
  ];
}
