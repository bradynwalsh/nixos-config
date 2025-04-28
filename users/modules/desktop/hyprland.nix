{ conifg, lib, pkgs, inputs, ... }:

{
  config.wayland.windowManager.hyprland.enable = true;
  config.wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  config.wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun --allow-images --allow-markup -p ''";
    "$lock" = "${pkgs.systemd}/bin/loginctl lock-session";

    env = "XCURSOR_SIZE,24";

    exec-once = [
      "hyprpaper"
      "mako"
    ];

    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";

    bind = [
      "$mod, Q, exec, $terminal"
      "$mod, C, killactive"
      "$mod, M, exit"
      "$mod, L, exec, $lock"
      "$mod, V, togglefloating"
      "$mod, R, exec, $menu"
      "$mod, P, pseudo"
      "$mod, J, togglesplit"
      "$shiftMod, PRINT, exec, hyprshot -m region"
    ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      ) ++ [
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
      ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    monitor = [
      ",highres,auto,1"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 20;

      border_size = 2;

      "col.active_border"   = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };

    ecosystem = {
      no_update_news = true;
    };

    misc = {
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
    };
  };

  config.services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hypridle;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 120;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };

  config.programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = {
        path = "${./wallpaper.png}";
        blur_passes = 1;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      input-field = {
        size = {
          width = 250;
          height = 60;
        };
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 ;# Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "JetBrains Mono Nerd Font Mono";
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
        hide_input = false;
        position = "0,-120";
      };

      label = [
        {
          text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
          color = "rgba(255,255,255,0.6)";
          font_size = 120;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          halign = "center";
          valign = "top";
          position = "0,-300";
        }
        {
          text = ''Hi there, $USER'';
          color = "rgba(255,255,255,0.6)";
          font_size = 25;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = "0,-40";
        }
      ];

      auth = {
        fingerprint = {
          enabled = true;
        };
      };
    };
  };

  config.home.packages = [
    inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
    pkgs.networkmanagerapplet
    (pkgs.hyprshot.override { hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland ; })
  ];

  config.xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${./wallpaper.png}
    wallpaper = ,${./wallpaper.png}
  '';

  config.gtk.iconTheme = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "adwaita-icon-theme";
  };
}
