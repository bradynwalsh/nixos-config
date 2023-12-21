{ config, pkgs, ... }:

{
  config.programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "cpu"
          "memory"
          "network"
          "wireplubmer"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        clock = {
          interval = 1;
          format = "{: %R   %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };

    systemd.enable = true;

    style = ''
      * {
        border: none;
        font-family: Roboto Mono SemiBold, "Isoevka Nerd Font";
        font-size: 20px;
        min-height: 0;
        font-weight: normal;
      }

      #waybar {
        background-color: transparent;
      }

      #waybar > box {
        border-radius: 8px;
        margin: 8px 8px 8px 8px;
        background-color: rgba(20, 22, 30, 0.7); 
        box-shadow: 1 1 3 1px #151515;
        transition-property: background-color;
        transition-duration: .5s;
      }

      #workspaces,
      #window,
      #clock,
      #cpu,
      #memory,
      #network,
      #wireplumber
      {
        background-color: #2e3440;
        color: #a3be8c;
        border-radius: 10px;
        margin: 5px;
        margin-left: 5px;
        margin-right: 5px;
        padding: 0px 10px 0px 10px;
        font-weight: bold;     
      }
    '';
  };
}
