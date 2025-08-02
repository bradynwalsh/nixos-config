{ pkgs, ... }:

{
  # Enable USB Auto-mounting
  services.devmon.enable = true;
  services.udisks2.enable = true;

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  environment.systemPackages = [
    pkgs.mediawriter
  ];
}
