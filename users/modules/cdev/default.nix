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

    pkgs.pkg-config
    pkgs.openssl.dev
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
  };
}
