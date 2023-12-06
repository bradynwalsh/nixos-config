{ config, lib, pkgs, inputs, ... }:

{
  # Use Hyprland package from flake
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
