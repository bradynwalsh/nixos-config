{ config, pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;

      permittedInsecurePackages = [
        "beekeeper-studio-5.1.5"        
      ];
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;

      # Add Cachix Cache
      substituters = [
        "https://bradynwalsh.cachix.org"
      ];
      trusted-public-keys = [
        "bradynwalsh.cachix.org-1:PpxfULL8qxYZFPSfnm4eN1X+aLpfAh8IZYtNhU51GC8="
      ];
    };
  };

  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      if [[ -e /run/current-system ]]; then
        echo "--- diff to current-system"
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${config.nix.package}/bin diff /run/current-system "$systemConfig"
        echo "---"
      fi
    '';
  };
}
