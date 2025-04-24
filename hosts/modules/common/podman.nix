{ pkgs, ... }:

{
  virtualisation.containers.enable = true;

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dive
    podman-tui
  ];
}
