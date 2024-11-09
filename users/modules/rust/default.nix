{pkgs, ... }: {

  home.packages = [
    pkgs.gcc
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer
  ];
}
