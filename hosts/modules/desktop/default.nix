{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./sound.nix
    ./graphics.nix
    ./networking.nix
    ./lock.nix
  ];
}
