{pkgs, config, ... }: {

  home.packages = [
    pkgs.rustup
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}
