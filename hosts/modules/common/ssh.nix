{config, ... }:

{
  # Enable sshd with some security hardening
  services.openssh = {
    enable = true;

    allowSFTP = false;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };

    openFirewall = false;

    extraConfig = ''
      AllowTcpForwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
    '';

    hostKeys = [
      {type = "rsa"; bits = 4096; path = "/persist/config/sshd/ssh_host_rsa_key"; }
      {type = "ed25519"; path = "/persist/config/sshd/ssh_host_ed25519_key"; }
    ];
  };

  # Persist SSH Host Keys
  environment.persistence."/persist/config/sshd" = {
    hideMounts = true;
  };
}
