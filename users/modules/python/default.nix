{pkgs, ... }: {

  home.packages = [
    pkgs.uv
    (pkgs.python3.withPackages(ps: with ps; [certifi]))
    pkgs.ruff
    pkgs.black
  ];
}
