{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.clamav
  ];

  services.clamav.updater.enable = true;
}
