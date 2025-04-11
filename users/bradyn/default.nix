{ config, lib, pkgs, ... }:

{
  users.users.bradyn = {
    isNormalUser = true;
    extraGroups = ["wheel" "vboxusers" "qemu-libvirtd" "libvirtd" "networkmanager"];
    hashedPasswordFile = config.sops.secrets.bradyn_hashed_password.path;
  };

  sops.secrets.bradyn_hashed_password = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
}
