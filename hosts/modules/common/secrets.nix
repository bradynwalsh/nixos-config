{ config, ... }:

{
  # Use persisted SSH Host Key for secret decryption
  sops.age.sshKeyPaths = ["/persist/config/sshd/ssh_host_ed25519_key"];
}
