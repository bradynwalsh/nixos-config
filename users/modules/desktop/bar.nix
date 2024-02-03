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
          "clock"
          "custom/weather"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "battery"
          "wireplumber"
          "tray"
        ];

        "hyprland/window" = {
          format = "{}";
          max-length = 70;
        };

        "hyprland/workspaces" = {
          disable-scroll = false;
          format = "{icon}";
          format_focused = "< %g ● >";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "default" = "";
            "urgent" = "";
            "focused" = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        clock = {
          timezones = ["Australia/Adelaide" "UTC"];
          interval = 1;
          format = "{:  %I:%M %p    %a, %b%e}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "custom/weather" = {
          interval = 60;
          format = "{}";
          exec = "${pkgs.curl}/bin/curl \"wttr.in?format=%I+%c+%t\"";
        };

        tray = {
          icon-size = 19;
          spacing = 10;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{icon}  {capacity}%";
          format-icons = ["" "" "" "" ""];
          format-plugged = "  {capacity}%";
          format-charging = "⚡ {capacity}%";
          format-alt = "{time} {icon}";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = ["" "" ""];
        };

        network = {
          interface = "wlp166s0";
          format = "{ifname}";
          format-disconnected = "";
          format-wifi = "{essid}({ipaddr})  ";
        };

        temperature = {
          thermal-zone = 1;
          format = "{temperatureC}°C ";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C ";
        };
      };
    };

    systemd.enable = true;

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Roboto Mono SemiBold, "Isoevka Nerd Font";
        font-size: 16px;
        min-height: 18px;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(21,18,27, 0);
        color: #cdd6f4;
      }

      tooltip {
        background: #1e1e2e;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: #11111b;
      }

      #custom-arch,
      #custom-power_profile,
      #custom-weather,
      #window,
      #clock,
      #temperature,
      #battery,
      #pulseaudio,
      #wireplumber,
      #network,
      #bluetooth,
      #custom-updates,
      #workspaces,
      #tray,
      #backlight,
      #custom-powermenu  
      {
        background: #1e1e2e;
        opacity: 0.85;
        padding: 0px 10px;
        margin: 4px 0px 0px 0px;
      }

      #workspaces button {
        padding: 2px;
        color: #313244;
        margin-right: 2px;
      }

      #workspaces button.active {
        color: #a6adc8;
      }

      #workspaces button.focused {
        color: #a6adc8;
        background: #eba0ac;
        border-radius: 10px;
      }

      #workspaces button:hover {
        background: #11111b;
        color: #cdd6f4;
        border-radius: 10px;
      }

      #tray {
        border-radius: 10px;
        margin-right: 10px;
        border: 1px solid #B086E3;
      }

      #workspaces {
        background: #1e1e2e;
        border-radius: 10px;
        margin-left: 10px;
        padding-right: 2px;
        padding-left: 2px;
        border: 1px solid #B086E3;
      }

      #window {
        border-radius: 10px;
        border: 1px solid #B086E3;
        margin-left:10px ;
      }

      #clock {
        color: #ff8dcd;
        border-radius: 10px 0px 0px 10px;
        margin-left: 10px;
        border: 1px solid #B086E3;
        border-right: none;
      }

      #network {
        color: #f9e2af;
        border-radius: 10px 0px 0px 10px;
        border-left: 0px;
        border-right: 0px;
      }

      #bluetooth {
        color: #89b4fa;
        border-radius: 0px 10px 10px 0px;
        margin-right: 10px;
      }

      #wireplumber {
        color: #89b4fa;
        border: 1px solid #B086E3;
        border-radius: 10px;
        margin-right: 10px;
        font-size: 16px;
      }

      #battery {
        color: #50fa7b;
        border-radius: 10px 10px 10px 10px;
        margin-right: 10px;
        border: 1px solid #B086E3;
      }

      #custom-weather {
        border-radius: 0px 10px 10px 0px;

        margin-left: 0px;
        border-top: 1px solid #B086E3;
        border-right: 1px solid #B086E3;
        border-bottom: 1px solid #B086E3; 
      }
    '';
  };
}
