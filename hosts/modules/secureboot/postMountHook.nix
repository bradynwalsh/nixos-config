{ pkgs, ... }:

# Create and Enroll SecureBoot Keys on partition creation
''
${pkgs.sbctl}/bin/sbctl create-keys
${pkgs.sbctl}/bin/sbctl enroll-keys -t

mkdir /mnt/persist/secureboot
cp /etc/secureboot /mnt/persist/secureboot
''
