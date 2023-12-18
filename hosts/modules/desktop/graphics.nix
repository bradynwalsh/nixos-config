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

  # Use tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd Hyprland";
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

  # Persist fingerprints for tuigreet
  environment.persistence."/persist/config/fprintd" = {
    hideMounts = true;
    directories = [
      "/var/lib/fprint"
    ];
  };
}
