{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      nixpkgs.follows = "nixpkgs";
    }
  };

  outputs = { self, nixpkgs, nixos-hardware, disko }: {
    nixosConfigurations.artemis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko

        ./hosts/artemis
        ./hosts/common
        nixos-hardware.nixosModules.framework-12th-gen-intel

        ./users/bradyn
      ];
    };
  };
}
