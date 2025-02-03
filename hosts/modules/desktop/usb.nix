{ pkgs, ... }:

{
  # Enable USB Auto-mounting
  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  environment.systemPackages = [
    pkgs.mediawriter
  ];
}
