{ config, lib, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.bradyn = {
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
        ];
      };

      settings = {
        "extensions.autoDisableScopes" = 0; # Auto-enable installed extensions
      };
    };
  };
}
