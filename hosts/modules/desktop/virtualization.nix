{ pkgs, ... }:

{
  programs.virt-manager = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
}
