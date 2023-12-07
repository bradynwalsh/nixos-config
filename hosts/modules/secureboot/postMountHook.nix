{ sbctl, ... }:

# Create and Enroll SecureBoot Keys on partition creation
''
${sbctl} create-keys
${sbctl} enroll-keys -t

mkdir /mnt/persist/secureboot
cp /etc/secureboot /mnt/persist/secureboot
''
