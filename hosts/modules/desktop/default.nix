{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./sound.nix
    ./graphics.nix
    ./networking.nix
    ./bluetooth.nix
    ./virtualization.nix
    ./usb.nix
    ./flatpak.nix
  ];
}
