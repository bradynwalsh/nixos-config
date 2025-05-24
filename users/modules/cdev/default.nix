{pkgs, ... }: {

  home.packages = [
    pkgs.cmake
    pkgs.gnumake
    pkgs.lldb
    pkgs.clang
    pkgs.clang-tools
    pkgs.cmake-format
    pkgs.ninja
  ];
}
