{ pkgs, espPartition, ... }:

# Create and Enroll SecureBoot Keys on partition creation
''
MNTPOINT=$(mktemp -d)
mount /dev/mapper/crypt "$MNTPOINT" -o subvol=@persist
trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT

${pkgs.sbctl}/bin/sbctl create-keys
${pkgs.sbctl}/bin/sbctl enroll-keys --yes-this-might-brick-my-machine

mkdir -p "$MNTPOINT/secureboot/etc/secureboot"
cp -r /etc/secureboot "$MNTPOINT/secureboot/etc"

mkdir /boot
mount ${espPartition} /boot
mkdir /boot/EFI
mkdir /boot/EFI/Linux
mkdir /boot/EFI/BOOT
mkdir /boot/EFI/systemd
''
