{
  description = "My NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboot = {
      url = "github:nix-community/lanzaboot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, disko, home-manager, lanzaboot, ... }@inputs: {
    nixosConfigurations.artemis = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        lanzaboot.nixosModules.lanzaboot

        ./hosts/artemis
        nixos-hardware.nixosModules.framework-12th-gen-intel

        ./users/bradyn

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.bradyn = import ./users/bradyn/home.nix;
        }
      ];
    };
  };
}
