{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./kernel.nix
    ./boot.nix
    ./time.nix
    ./corePackages.nix
  ];
}
