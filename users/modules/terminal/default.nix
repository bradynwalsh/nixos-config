{ config, pkgs, lib, input, ... }:

{
  imports = [
    ./starship.nix
    ./fish.nix
  ];
}
