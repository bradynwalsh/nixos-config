{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./kernel.nix
    ./boot.nix
  ];
}
