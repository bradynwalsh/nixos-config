{ config, ... }:

{
  # Enable Tailscale
  services.tailscale = {
    enable = true;
  };

  # Enable MagicDNS
  networking.nameservers = ["100.100.100.100" "1.1.1.1" "8.8.8.8"];
  networking.search = ["tail93136.ts.net"];

  # Enable persistence of tailscale keys/auth creds
  environment.persistence."/persist/config/tailscale" = {
    hideMounts = true;

    directories = [
      "/var/lib/tailscale"
    ];
  };
}