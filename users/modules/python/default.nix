{pkgs, ... }: {

  home.packages = [
    pkgs.uv
    pkgs.python3
    pkgs.ruff
  ];
}
