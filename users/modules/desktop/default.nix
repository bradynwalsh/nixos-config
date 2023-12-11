{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./wofi.nix
    ./kitty.nix
    ./firefox.nix
  ];
}