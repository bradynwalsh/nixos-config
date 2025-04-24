{ config, lib, pkgs, ... }:

{
  users.users.bradyn = {
    isNormalUser = true;
    extraGroups = ["wheel" "vboxusers" "qemu-libvirtd" "libvirtd" "networkmanager" "podman"];
    hashedPasswordFile = config.sops.secrets.bradyn_hashed_password.path;
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
  };

  sops.secrets.bradyn_hashed_password = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
}
