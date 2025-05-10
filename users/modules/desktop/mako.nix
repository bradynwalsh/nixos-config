{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      font = "JetBrains Mono 12";
      background-color = "#2B3339CC";

      width = "300";
      height = "110";

      border-size = "2";
      border-color = "#4C566A";
      border-radius = "18";

      default-timeout = "60000";
    };

    criteria = {
      "urgency=low" = {
        border-color = "#cccccc";
      };

      "urgency=normal" = {
        border-color = "#d08770";
      };

      "urgency=high" = {
        border-color = "#bf616a";
        default-timeout = "0";
      };

      "category=mpd" = {
        default-timeout = "20000";
        group-by = "category";
      };
    };
  };
}
