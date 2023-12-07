{ pkgs, ... }:

# Create and Enroll SecureBoot Keys on partition creation
''
${pkgs.sbctl} create-keys
${pkgs.sbctl} enroll-keys -t

mkdir /mnt/persist/secureboot
cp /etc/secureboot /mnt/persist/secureboot
''
