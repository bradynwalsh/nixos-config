{ lib, pkgs, inputs, ... }:

{
  config.wayland.windowManager.hyprland.enable = true;
  config.wayland.windowManager.hyprland.package = null;
  config.wayland.windowManager.hyprland.portalPackage = inputs.xdph.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  config.wayland.windowManager.hyprland.configType = "lua";

  config.wayland.windowManager.hyprland.settings = {
    terminal = {
      _var = "kitty";
    };

    menu = {
      _var = "wofi --show drun --allow-images --allow-markup -p ''";
    };

    lock = {
      _var = "${pkgs.systemd}/bin/loginctl lock-session";
    };

    env = [
      { _args = ["XCURSOR_SIZE"  "24"]; }
      { _args = ["DESKTOP_SESSION" "gnome"]; } # Fix SecretStore/gnome-keyring integration for Electron (Obsidian)
    ];

    on = [
      {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function() hl.exec_cmd(\"hyprpaper\") end")
        ];
      }
      {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function() hl.exec_cmd(\"mako\") end")
        ];
      }
      {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function() hl.exec_cmd(\"gnome-keyring-daemon --start --components=secrets\") end")
        ];
      }
      {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function() hl.exec_cmd(\"${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1\") end")
        ];
      }
      {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline "function() hl.exec_cmd(\"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DESKTOP_SESSION\") end")
        ];
      }
    ];

    mod = { _var = "SUPER"; };
    shiftMod = { _var = "SUPER + SHIFT"; };

    bind = [
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + Q\"")
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + C\"")
          (lib.generators.mkLuaInline "hl.dsp.window.close()")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + M\"")
          (lib.generators.mkLuaInline "hl.dsp.exit()")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + L\"")
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(lock)")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + V\"")
          (lib.generators.mkLuaInline "hl.dsp.window.float({action = \"toggle\" })")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + R\"")
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(menu)")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "mod .. \" + P\"")
          (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline "shiftMod .. \" + PRINT\"")
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region\")")
        ];
      }
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
              {
                _args = [
                  (lib.generators.mkLuaInline "mod .. \" + ${ws}\"")
                  (lib.generators.mkLuaInline "hl.dsp.focus({workspace = ${toString (x + 1)}})")
                ];
              }
              {
                _args = [
                  (lib.generators.mkLuaInline "shiftMod .. \" + ${ws}\"")
                  (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = ${toString (x + 1)}})")
                ];
              }
            ]
          )
          10)
      ) ++ [
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + S\"")
            (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special(\"magic\")")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "shiftMod .. \" + S\"")
            (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"special:magic\"})")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + mouse:272\"")
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + mouse:273\"")
            (lib.generators.mkLuaInline "hl.dsp.window.resize()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
      ];
  };

  config.wayland.windowManager.hyprland.extraConfig = ''
    hl.monitor({
      output = "",
      mode = "highres",
      position = "auto",
      scale = 1
    })

    hl.config({
      general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        layout = "dwindle",
        col = {
          active_border = {
            colors = {
              "rgba(33ccffee)",
              "rgba(00ff99ee)"
            },
            angle = 45
          },
          inactive_border = "rgba(595959aa)"
        }
      },
      decoration = {
        rounding = 10,
        blur = {
          enabled = true,
          size = 3,
          passes = 1,
          vibrancy = 0.1696,
        },
        shadow = {
          enabled = true,
          range = 4,
          render_power = 3,
          color = "rgba(1a1a1aee)",
        }
      },
      ecosystem = {
        no_update_news = true
      },
      misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0
      }
    })

    hl.window_rule({
      name = "Obsidian_Web_Clipper_Fix",
      match = {
        title = "(.*)(Obsidian)(.*)"
      },
      focus_on_activate = true
    })
  '';

  config.services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock}/bin/hyprlock";
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
    package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;

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
        size = "250, 60";
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
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    pkgs.networkmanagerapplet
    (pkgs.hyprshot.override { hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland ; hyprpicker = inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker ; })
  ];

  config.xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper {
      monitor =
      path = ${./wallpaper.png}
      fit_mode = fill
    }

    splash = false
  '';

  config.gtk.iconTheme = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "adwaita-icon-theme";
  };

  config.xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
