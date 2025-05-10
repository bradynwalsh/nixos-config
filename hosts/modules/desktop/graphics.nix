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
    portalPackage = inputs.xdph.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  # Install xdg utils
  environment.systemPackages = [
    pkgs.xdg-utils
  ];

  # Use tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd Hyprland --user-menu --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red";
        user = "greeter";
      };
    };
  };

  environment.persistence."/persist/config/greetd" = {
    hideMounts = true;
    directories = [
      "/var/cache/tuigreet"
    ];
  };

  # Persist fingerprints for fprintd
  environment.persistence."/persist/config/fprintd" = {
    hideMounts = true;
    directories = [
      "/var/lib/fprint"
    ];
  };

  # Enable changing screen brightness
  programs.light.enable = true;
}
