{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    font = "JetBrains Mono 12";
    backgroundColor = "#2B3339CC";

    width = 300;
    height = 110;

    borderSize = 2;
    borderColor = "#4C566A";
    borderRadius = 18;

    defaultTimeout = 60000;

    extraConfig = ''
      [urgency=low]
      border-color=#cccccc

      [urgency=normal]
      border-color=#d08770

      [urgency=high]
      border-color=#bf616a
      default-timeout=0

      [category=mpd]
      default-timeout=20000
      group-by=category
    '';
  };
}
