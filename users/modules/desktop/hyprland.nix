{ conifg, lib, pkgs, inputs, ... }:

{
  config.wayland.windowManager.hyprland.enable = true;
  config.wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  config.wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun --allow-images --allow-markup -p ''";
    "$lock" = "swaylock -f -i ${./lockscreen.png}";

    env = "XCURSOR_SIZE,24";

    exec-once = [
      "mako"
      "hyprpaper"
    ];

    "$mod" = "SUPER";

    bind = [
      "$mod, Q, exec, $terminal"
      "$mod, C, killactive"
      "$mod, M, exit"
      "$mod, L, exec, $lock"
      "$mod, V, togglefloating"
      "$mod, R, exec, $menu"
      "$mod, P, pseudo"
      "$mod, J, togglesplit"
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

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };
  };

  config.services.swayidle = {
    enable = true;

    timeouts = [
      { timeout = 60; command = "${pkgs.swaylock}/bin/swaylock -fF -i ${./lockscreen.png}"; }
      { timeout = 120; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];

    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF -i ${./lockscreen.png}"; }
    ];
  };

  config.home.packages = [
    inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
    pkgs.networkmanagerapplet
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
