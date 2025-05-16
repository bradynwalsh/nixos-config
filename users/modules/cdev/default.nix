{pkgs, ... }: {

  home.packages = [
    pkgs.gcc
    pkgs.cmake
    pkgs.gnumake    
  ];
}
