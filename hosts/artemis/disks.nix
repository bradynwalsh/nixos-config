{
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
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
                    "@/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    "@/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [ "compress=zstd" "noatime" ];

                      postMountHook = import ../modules/secureboot/postMountHook.nix;
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

  filesystems."/persist".neededForBoot = true;
}
