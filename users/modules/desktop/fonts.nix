{ pkgs, ... }:

{
  home.packages = with pkgs ; [
    jetbrains-mono
    nerdfonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.roboto-mono
  ];
}
