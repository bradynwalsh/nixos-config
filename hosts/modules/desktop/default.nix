{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./sound.nix
    ./graphics.nix
  ];
}
