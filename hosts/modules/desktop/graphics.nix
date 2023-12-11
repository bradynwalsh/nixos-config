{ config, lib, pkgs, inputs, ... }:

{
  # Graphical boot process
  boot.plymouth.enable = true;
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" ];

  # Use Hyprland package from flake
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
