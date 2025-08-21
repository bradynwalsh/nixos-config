{pkgs, ... }: {

  home.packages = [
    pkgs.cmake
    pkgs.gnumake
    pkgs.lldb
    pkgs.clang
    pkgs.clang-tools
    pkgs.llvm
    pkgs.lld
    pkgs.cmake-format
    pkgs.ninja
  ];
}
