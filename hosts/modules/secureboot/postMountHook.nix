{ pkgs, ... }:

# Create and Enroll SecureBoot Keys on partition creation
''
${pkgs.sbctl}/bin/sbctl create-keys
${pkgs.sbctl}/bin/sbctl enroll-keys --yes-this-might-brick-my-machine

mkdir /mnt/persist/secureboot
cp /etc/secureboot /mnt/persist/secureboot
''
