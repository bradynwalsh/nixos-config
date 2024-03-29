{ config, lib, pkgs, inputs, ... }:

{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";

          postCreateHook = import ../modules/secureboot/postCreateHook.nix {
            inherit pkgs;
            espPartition = "/dev/nvme0n1p1";
          };

          partitions = {
            ESP = {
              type = "EF00";
              size = "2G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypt";

                settings = {
                  allowDiscards = true;
                  bypassWorkqueues  = true;
                };

                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];

                  subvolumes = {
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };

    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = ["size=8G"];
      };
    };
  };

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/".neededForBoot = true;
}
